from django.db import models
from django.contrib.auth.models import AbstractUser

# Custom User Model
class User(AbstractUser):
    area = models.CharField(max_length=500)
    city = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    phone = models.CharField(max_length=10)

    # ✅ Fix reverse accessor clashes
    groups = models.ManyToManyField(
        'auth.Group', related_name='core_users', blank=True
    )
    user_permissions = models.ManyToManyField(
        'auth.Permission', related_name='core_users_permissions', blank=True
    )

    class Meta:
        app_label = 'core'  # ✅ Ensure Django recognizes this model

# Transaction Model (Represents pet listings)
class Transaction(models.Model):
    STATUS_CHOICES = [
        ('Pending', 'Pending'),
        ('Accepted', 'Accepted'),
    ]

    id = models.AutoField(primary_key=True)  # Explicitly defining the ID field
    name = models.CharField(max_length=100)
    desc = models.TextField()
    img = models.ImageField(upload_to='pics')
    animal_type = models.CharField(max_length=50)  # Renamed category to animal_type
    donor_id = models.ForeignKey(User, on_delete=models.CASCADE)  # Owner of the pet
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='Pending')

    class Meta:
        verbose_name = "Transaction"
        verbose_name_plural = "Transactions"

    def __str__(self):
        return f"{self.donor_id.username}'s {self.name}"

# Request Model (Represents adoption requests)
class Request(models.Model):
    STATUS_CHOICES = [
        ('Pending', 'Pending'),
        ('Accepted', 'Accepted'),
        ('Rejected', 'Rejected'),
    ]

    id = models.AutoField(primary_key=True)  # Explicitly defining the ID field
    reason = models.TextField()
    applicant_id = models.ForeignKey(User, on_delete=models.CASCADE)  # The user making the request
    pet_id = models.ForeignKey(Transaction, on_delete=models.CASCADE)  # Reference to the transaction (pet)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='Pending')

    class Meta:
        verbose_name = "Request"
        verbose_name_plural = "Requests"

    def __str__(self):
        return f"{self.applicant_id.username} -> Request for {self.pet_id.name}"
    
# Queries Model
class Queries(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    issue = models.TextField(max_length=500)
    phone = models.CharField(max_length=10)
    query = models.TextField()

    class Meta:
        verbose_name = "Query"
        verbose_name_plural = "Queries"

    def __str__(self):
        return self.email