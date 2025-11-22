from django.shortcuts import redirect, render, get_object_or_404
from django.utils import tree
from .models import * 
from django.contrib import messages
from django.contrib.auth import login, logout
from django.contrib.auth import authenticate
from django.contrib.auth.decorators import login_required
from .forms import EditPetForm

# Create your views here.
TEMPLATE_MAPPING = {
    "home-page": "index.html",
    "explore-page": "explore.html",
    "about-page": "about.html",
    "contact-page": "contact.html",
    "pet-details-page": "petDetails.html",
    "profile-page": "profile.html",
    "login-page": "login.html",
    "registration-page": "register.html",
    "transaction-create-page" : "transactionCreate.html",
    "transaction-delete-page" : "transactionDelete.html",
    "request-delete-page" : "requestDelete.html",
    "transaction-closing-page": "transactionClosing.html"
}

def homeRenderer(request):
    context = {
        'user': request.user
    }
    return render(request, 'index.html', context)


from django.shortcuts import render
#from .models import Pet  # Assuming you are paginating pet listings
from django.core.paginator import Paginator

def exploreRenderer(request):
    # Retrieve all objects (filter them as needed)
    category = request.GET.get('category', None)
    if category:
        objects = Transaction.objects.filter(category__icontains=category).order_by('-id')
    else:
       objects = Transaction.objects.order_by('-id')


    # Set up pagination: Show 6 objects per page
    paginator = Paginator(objects, 6)  # Show 6 objects per page

    # Get the page number from the GET request (default to 1 if no page is specified)
    page_number = request.GET.get('page', 1)

    # Get the Page object for the current page
    page_objects = paginator.get_page(page_number)

    # Pass the paginated objects to the context
    return render(request, TEMPLATE_MAPPING["explore-page"], context={"page_objects": page_objects, "selected_category": category})

def aboutRenderer(request):
    if request.method == "GET":
        return render(request, TEMPLATE_MAPPING["about-page"])


def contactRenderer(request):
    if request.method == "GET":
        return render(request, TEMPLATE_MAPPING["contact-page"])
    
    elif request.method == "POST":
        name = request.POST.get("w3lName")
        email = request.POST.get("w3lSender")
        issue = request.POST.get("w3lSubect")
        phonenumber = request.POST.get("w3lPhone")
        query = request.POST.get("w3lMessage")
        Queries.objects.create(name=name, email=email, issue=issue, phone=phonenumber, query=query)
        messages.add_message(request, messages.SUCCESS, "Query has been sent !")
        return render(request, TEMPLATE_MAPPING["contact-page"])

from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from core.models import Request, Transaction
from django.contrib.auth.models import User

def petDetailsRenderer(request, transaction_id):
    transaction = get_object_or_404(Transaction, id=transaction_id)

    if request.method == "GET":
        return render(request, TEMPLATE_MAPPING["pet-details-page"], context={"pet": transaction})

    elif request.method == "POST":
        if request.user.id == transaction.donor_id.id:
            messages.error(request, "You cannot request a pet from yourself.")
        else:
            reason = request.POST.get("reason")
            applicant = request.user  # Directly use request.user
            
            # Debugging: Print transaction info
            print(f"Transaction: {transaction}, ID: {transaction.id}")

            if transaction:  # Ensure transaction is valid
                Request.objects.create(
                    reason=reason,
                    applicant_id=applicant,
                    pet_id=transaction  # ✅ Ensure ForeignKey is assigned correctly
                )
                messages.success(request, "Request successfully created.")
            else:
                messages.error(request, "Transaction not found or invalid.")

        return redirect("pet-details-page", transaction_id=transaction.id)  # Redirect to avoid form resubmission

from django.shortcuts import render, get_object_or_404
from core.models import User, Request, Transaction
from django.contrib.auth.models import User

def profileRenderer(request, user_id):
    if request.method == "GET":
        profile_user = get_object_or_404(User, id=user_id)
        is_self = request.user.id == user_id

        user_requests = Request.objects.filter(applicant_id=profile_user)
        transactions = Transaction.objects.filter(donor_id=profile_user)

        # ✅ Modify `requested_transactions` to directly include request and transaction data
        requested_transactions = [
            {
                "request": req,
                "pet": req.pet_id,  # The Transaction object (pet listing)
                "status": req.status  # Status of the request
            }
            for req in user_requests
        ]

        return render(request, 'profile.html', context={
            "is_self": is_self,
            "profile": profile_user,
            "requests": requested_transactions,  # ✅ Pass this directly
            "transactions": transactions
        })

def deleteReqest(request, request_id):
    if request.method == "POST":
        Request.objects.get(id=request_id).delete()
        messages.add_message(
            request, 
            messages.SUCCESS,
            "Request Deleted"
        )
        return redirect(to=f"/profile/{request.user.id}")


from django.contrib.auth import get_user_model, authenticate, login
from django.shortcuts import render, redirect
from django.contrib import messages

User = get_user_model()  # Get the custom user model

def user_login(request):
    if request.method == "GET":
        return render(request, "login.html")

    elif request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        print(f"Attempting login for: {username}")

        user = authenticate(request, username=username, password=password)

        if user is None:
            print("Authentication failed")
            messages.error(request, "Login Failed: Invalid username or password")
            return render(request, "login.html")

        print(f"Login successful for {user.username}")

        login(request, user)
        return redirect("/")



def register(request):
    if request.method == "GET":
        return render(request, TEMPLATE_MAPPING["registration-page"])

    elif request.method == "POST":
        username = request.POST.get("username")
        email = request.POST.get("email")
        password = request.POST.get("password")
        confirm = request.POST.get("confirm")
        first_name = request.POST.get("first_name")
        last_name = request.POST.get("last_name")
        area = request.POST.get("area")
        city = request.POST.get("city")
        country = request.POST.get("country")
        phone = request.POST.get("phone")

        if User.objects.filter(username=username).exists():
            messages.add_message(request, messages.ERROR, "User already exists!")
            return render(request, TEMPLATE_MAPPING["registration-page"])

        if User.objects.filter(email=email).exists():
            messages.add_message(
                request,
                messages.ERROR, 
                "Email already exists!"
                )
            return render(request, TEMPLATE_MAPPING["registration-page"])
        
        if password != confirm:
            messages.add_message(request, messages.ERROR, "Passwords do not match")
            return render(request, TEMPLATE_MAPPING["registration-page"])
        
        User.objects.create_user(
            username=username,
            password=password,
            email=email,
            first_name=first_name,
            last_name=last_name,
            area=area,
            city=city,
            country=country,
            phone=phone)
        
        user = authenticate(username=username, password=password)
        if user is None:
            messages.add_message(request, messages.ERROR, "Login Failed")
            return render(request, TEMPLATE_MAPPING["login-page"])
        
        login(request, user)

        return redirect("/")


def user_logout(request):
    if request.method == "GET" and request.user.is_authenticated:
        logout(request)
        return redirect("/")
    elif not request.user.is_authenticated:
        return redirect("/login")


from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.models import User
from .models import Transaction

def transactionCreator(request):
    if request.method == "GET":
        return render(request, TEMPLATE_MAPPING["transaction-create-page"])

    elif request.method == "POST":
        name = request.POST.get("w3lName")
        animal = request.POST.get("w3lCategory")  # Renamed category -> animal_type
        description = request.POST.get("w3lDesc")
        image = request.FILES.get("w3lImage")
        donor = User.objects.get(id=request.user.id)

        # Fixed field names
        Transaction.objects.create(
    name=name, 
    animal_type=animal,  # Renamed from category
    desc=description, 
    img=image, 
    donor_id=donor  # ✅ Corrected field name
)


        messages.success(request, "Transaction Created")

        return redirect('profile-page', user_id=request.user.id)  # Use URL name instead of hardcoded path


def transactionDeleter(request, transaction_id):
    if request.method == "POST":
        Transaction.objects.get(id=transaction_id).delete()
        messages.add_message(
            request, 
            messages.SUCCESS,
            "Transaction Deleted"
        )
        return redirect(to=f"/profile/{request.user.id}")


def transactionAcceptedAndClosed(request, transaction_id):
    if request.method == "GET":
        applicant_requests = Request.objects.filter(transaction_id=transaction_id)
        transaction = Transaction.objects.get(id=transaction_id)

        return render(request, TEMPLATE_MAPPING["transaction-closing-page"], context={"applicants": applicant_requests,
        "transaction":transaction})

    if request.method == "POST":
        request_id = request.POST.get("applicant")
        chosen_request = Request.objects.get(id=request_id)
        transaction = Transaction.objects.get(id=transaction_id)
        transaction.save()
        messages.add_message(
            request,
            messages.SUCCESS,
            "Trasaction Completed and Closed"
        )

        return redirect(to=f"/profile/{request.user.id}")

from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from .models import Transaction
from .forms import EditPetForm

@login_required
def edit_pet(request, transaction_id):
    transaction = get_object_or_404(Transaction, id=transaction_id)

    print(f"User: {request.user}, Is Admin: {request.user.is_staff}")  # Debugging
    print(f"Transaction Donor: {transaction.donor_id}, Logged-in User: {request.user}")

    # Ensure only the pet owner can edit
    if transaction.donor_id != request.user:
        print("User is NOT the owner. Redirecting to home.")
        return redirect('home')

    if request.method == 'POST':
        form = EditPetForm(request.POST, request.FILES, instance=transaction)
        if form.is_valid():
            form.save()
            return redirect('profile', user_id=request.user.id)  # Adjust if necessary
    else:
        form = EditPetForm(instance=transaction)

    return render(request, 'edit_pet.html', {'form': form})


# Todo:
# Html templates
# Regex
# Dark Mode check certain pages
# Navbar dynamic



from django.shortcuts import render
from .models import Request, Transaction
from django.shortcuts import render
from django.contrib.auth.decorators import login_required


from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import EditProfileForm
from .models import User

@login_required
def edit_profile(request):
    if request.method == 'POST':
        form = EditProfileForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            return redirect('profile-page', user_id=request.user.id)
    else:
        form = EditProfileForm(instance=request.user)
    return render(request, 'edit_profile.html', {'form': form})


#ADMIN PROFILE HANDLING


from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages

def admin_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None and user.is_staff:
            login(request, user)
            return redirect('admin-dashboard')
        else:
            messages.error(request, 'Invalid credentials or not an admin user.')
    return render(request, 'admin_login.html')


from django.contrib.auth.decorators import user_passes_test

def is_admin(user):
    return user.is_authenticated and user.is_staff

from django.shortcuts import render
from django.contrib.auth.decorators import login_required, user_passes_test
from core.models import User, Transaction, Request  # Import models

def is_admin(user):
    return user.is_staff  # Ensure this function is defined for admin check

from django.shortcuts import get_object_or_404

@login_required
@user_passes_test(is_admin, login_url='/admin-login/')
def admin_dashboard(request):
    # Get filters from request
    status_filter = request.GET.get('status')
    search_query = request.GET.get('search', '')
    user_id = request.GET.get('user_id')  # Get user_id from URL

    # Filter transactions by status (if provided)
    transactions = Transaction.objects.filter(status=status_filter) if status_filter else Transaction.objects.all()
    
    # Filter users by ID or username (if search query is provided)
    if search_query:
        if search_query.isdigit():
            users = User.objects.filter(id=int(search_query), is_staff=False)
        else:
            users = User.objects.filter(username__icontains=search_query, is_staff=False)
    else:
        users = User.objects.filter(is_staff=False)  # Exclude admins

    # Initialize requests, user_requests, and user_transactions to None
    requests = Request.objects.all()
    user_requests = None
    user_transactions = None
    selected_user = None

    # If user_id is provided, filter requests and transactions
    if user_id:
        selected_user = get_object_or_404(User, id=user_id)
        user_requests = Request.objects.filter(applicant_id=selected_user)
        user_transactions = Transaction.objects.filter(donor_id=selected_user)
        requests = user_requests  # Update requests to only show the selected user's requests

    return render(request, 'admin_dashboard.html', {
        'transactions': transactions,
        'requests': requests,
        'users': users,
        'search_query': search_query,
        'status_filter': status_filter,
        'selected_user': selected_user,
        'user_requests': user_requests,
        'user_transactions': user_transactions,
    })


@login_required
def edit_pet(request, transaction_id):
    transaction = get_object_or_404(Transaction, id=transaction_id)

    # Allow both the owner and admins to edit
    if transaction.donor_id != request.user and not request.user.is_staff:
        return redirect('home')  # Redirect unauthorized users

    if request.method == 'POST':
        form = EditPetForm(request.POST, request.FILES, instance=transaction)
        if form.is_valid():
            form.save()
            return redirect('profile-page', user_id=request.user.id)
    else:
        form = EditPetForm(instance=transaction)

    return render(request, 'edit_pet.html', {'form': form})


@login_required
@user_passes_test(is_admin, login_url='/admin-login/')
def transaction_create(request):
    if request.method == 'POST':
        form = TransactionForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('admin-dashboard')
    else:
        form = TransactionForm()
    return render(request, 'transaction_create.html', {'form': form})

@login_required
@user_passes_test(is_admin, login_url='/admin-login/')
def transaction_status_change(request, transaction_id):
    transaction = get_object_or_404(Transaction, id=transaction_id)
    if request.method == 'POST':
        status = request.POST.get('status')
        transaction.status = status
        transaction.save()
        return redirect('transactions_list')


from django.shortcuts import render
from django.contrib.auth.decorators import login_required, user_passes_test
from .models import Transaction, Request

@login_required
@user_passes_test(is_admin, login_url='/admin-login/')
def transactions_list(request):
    transaction_id = request.GET.get('transaction_id', None)  # Get transaction ID from URL
    status_filter = request.GET.get('status', None)  # Get status filter from URL
    
    transactions = Transaction.objects.all()  # Start with all transactions

    # If transaction_id is provided, filter by that transaction only
    if transaction_id:
        transactions = transactions.filter(id=transaction_id)
    else:
        # Apply status filtering only if a specific status is selected
        if status_filter and status_filter != "All":
            transactions = transactions.filter(status=status_filter)
        else:
            transactions = Transaction.objects.all()  # Show all if "All" is selected

    # Attach accepted user if the transaction is accepted
    for transaction in transactions:
        accepted_request = Request.objects.filter(pet_id_id=transaction.id, status="Accepted").first()
        transaction.accepted_user = accepted_request.applicant_id.username if accepted_request else "N/A"

    return render(request, 'transactions_list.html', {
        'transactions': transactions,
        'selected_status': status_filter,  # Pass selected status to template
    })

def requests_list(request):
    requests = Request.objects.all()
    return render(request, 'requests_list.html', {
       'requests': requests,
    })
    
def demo(request):
    return render(request, 'demo.html')


def report(request):
    return render(request, 'report.html')

import csv
from django.http import HttpResponse
from .models import Transaction, Request, User

def generate_report(request):
    # Create the HTTP response to send the file
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="admin_dashboard_report.csv"'

    # Create a CSV writer object
    writer = csv.writer(response)

    # Write the headers for the CSV file
    writer.writerow(['Transactions'])
    writer.writerow([ 'NAME', 'Description','Status','ID'])  # Adjust based on your Transaction model
    transactions = Transaction.objects.all()
    for transaction in transactions:
        writer.writerow([transaction.name , transaction.desc , transaction.status,transaction.donor_id.username])

    # Add some space between sections in the CSV file
    writer.writerow([])
    writer.writerow(['Requests'])
    writer.writerow(['ID', 'REASON',  'STATUS','USERNAME'])  # Adjust based on your Request model
    requests = Request.objects.all()
    for request in requests:
        writer.writerow([request.pet_id.name, request.reason, request.status,request.applicant_id.username])

    # Add more space before users section
    writer.writerow([])
    writer.writerow(['Users'])
    writer.writerow(['ID', 'Username', 'Email'])  # Adjust based on your User model
    users = User.objects.all()
    for user in users:
        writer.writerow([user.id, user.username, user.email])

    return response


def backtohome(request):
    return render(request, 'admin_dashboard.html')

from django.shortcuts import redirect, get_object_or_404
from core.models import Request, Transaction

def view_requests(request, transaction_id):
    """Fetch requests for a specific transaction (excluding hidden ones)."""
    transaction = get_object_or_404(Transaction, id=transaction_id)

    # Fetch requests excluding hidden ones
    requests = Request.objects.filter(pet_id=transaction).exclude(status="Hidden")

    return render(request, 'view_requests.html', {'transaction': transaction, 'requests': requests})

def approve_request(request, request_id):
    """Approve a request, update transaction status, and reject other requests."""
    request_obj = get_object_or_404(Request, id=request_id)

    # Approve request
    request_obj.status = "Approved"
    request_obj.save()

    # Update transaction status to Accepted
    transaction = request_obj.pet_id
    transaction.status = "Accepted"
    transaction.save()

    # Reject other pending requests
    Request.objects.filter(pet_id=transaction, status="Pending").exclude(id=request_id).update(status="Rejected")

    return redirect('view-requests-page', transaction_id=transaction.id)

def reject_request(request, request_id):
    """Reject a specific request."""
    request_obj = get_object_or_404(Request, id=request_id)
    request_obj.status = "Rejected"
    request_obj.save()

    return redirect('view-requests-page', transaction_id=request_obj.pet_id.id)

def hide_request(request, request_id):
    """Hide a request from the owner's view (without deleting it)."""
    request_obj = get_object_or_404(Request, id=request_id)
    request_obj.status = "Hidden"
    request_obj.save()

    return redirect('view-requests-page', transaction_id=request_obj.pet_id.id)

from django.shortcuts import render
from .models import Queries  # or whatever your model is called

def inquiries_list(request):
    inquiries = Queries.objects.all()
    return render(request, 'inquiries_list.html', {'inquiries': inquiries})

from django.shortcuts import redirect, get_object_or_404
from .models import Queries  # or whatever your model is called

def delete_inquiry(request, id):
    if request.method == "POST":
        inquiry = get_object_or_404(Queries, id=id)
        inquiry.delete()
    return redirect('inquiries_list')

from django.shortcuts import render

def home(request):
    return render(request, 'transactions_list.html')

