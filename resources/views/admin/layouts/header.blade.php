<div class="header  flex flex-col md:flex-row justify-between items-start md:items-center pb-5 mb-6 border-b border-gray-200">
    <div class="flex items-center">
      
        <h1 class="text-2xl font-bold text-navy">


    <h1 class="text-2xl font-bold text-navy">
    @if (Route::is('admin.contacts'))
        Contacts Overview
    @elseif (Route::is('admin.opportunities'))
        Opportunities Overview
    @elseif (Route::is('admin.appointments'))
        Appointments Overview
    @elseif (Route::is('admin.invoices'))
        Invoices Overview
    @else
        Dashboard Overview
    @endif
</h1>




        </h1>
    </div>

    <div class="header-right flex items-center w-full md:w-auto mt-4 md:mt-0">
        @if ((is_role() == 'company' && session()->has('company_admin')) || (is_role() == 'admin' && session()->has('super_admin')))
        <div class="search-bar flex items-center bg-white rounded-full p-2 shadow-sm w-full md:w-64">
            <a href="{{ route('backtoadmin') }}?{{ is_role() == 'company' ? 'company=1' : 'admin=1' }}"
                class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-navy hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-full shadow transition-all duration-200">
                <i class="fas fa-arrow-left"></i>
                Back to Super Admin
            </a>
        </div>
        @endif

        <div class="user-actions flex items-center ml-4 relative group">
          <div class="user-profile flex items-center">
    <img 
        src="{{ Auth::user()->image ? asset(Auth::user()->image) : asset('images/user.png') }}" 
        alt="User Profile" 
        class="w-10 h-10 rounded-full object-cover ring-2 ring-blue-950 hover:ring-blue-600 transition cursor-pointer shadow-sm hover:shadow-md"
    >
</div>


            <div
                class="absolute right-0 mt-20 w-48 bg-white rounded-md shadow-lg border border-gray-200 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50"
            >
                <ul class="py-2 text-sm text-gray-700">
                    <li><a href="#" class="block px-4 py-2 hover:bg-gray-100">{{ Auth::user()->name ?? '' }}</a></li>
                    <li><a href="{{ route('admin.user.profile') }}" class="block px-4 py-2 hover:bg-gray-100">My Profile</a></li>
                    <li>
                        <a onclick="event.preventDefault(); document.getElementById('logout-form').submit();" class="block px-4 py-2 text-red-600 hover:bg-gray-100">Logout</a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="hidden">@csrf</form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
