@php
    $modules = session('user_modules_' . auth()->id(), []);
    use Illuminate\Support\Facades\Route;

    $currentUrl = request()->url();
    $logo = App\Models\Setting::where('key', 'logo')->first();
@endphp

<div class="navbar fixed top-0 left-0 z-30 w-full bg-navy text-white shadow-md">
    <div class="flex items-center justify-between px-5 h-16 border-b border-gray-700">

        {{-- Logo --}}
        <a href="/" class="flex items-center space-x-2">
            @if ($logo)
                <img src="{{ asset('logo/' . $logo->value) }}" alt="Company Logo" class="w-10 h-10 object-contain">
            @else
                <span class="font-bold text-lg">MyApp</span>
            @endif
        </a>

        {{-- Mobile Toggle --}}
        <button class="mobile-toggle text-white text-2xl md:hidden" onclick="toggleMobileMenu()">
            <i class="fas fa-bars"></i>
        </button>

        {{-- Nav Links --}}
        <ul id="nav-links" class="hidden md:flex flex-col md:flex-row items-start md:items-center 
                   absolute top-16 left-0 w-full bg-navy md:static md:bg-transparent 
                   md:w-auto md:space-x-6 z-50 transition-all duration-300 ease-in-out">

            {{-- Dashboard --}}
            @if (is_role() == 'super_admin' || is_role() == 'admin')
                    <li>
                        <a href="{{ route('admin.dashboard') }}" class="flex items-center px-3 py-2 rounded-lg transition
                                {{ $currentUrl == route('admin.dashboard')
                ? 'bg-white text-[#001B4C] font-semibold shadow-sm'
                : 'text-white hover:bg-blue-800 hover:text-gray-100' }}">
                            <i class="fas fa-home text-xl w-6 text-center"></i>
                            <span class="ml-2">Dashboard</span>
                        </a>
                    </li>
            @endif


            @if (is_role() == 'admin')

                    {{-- Opportunities --}}
                    <li>
                        <a href="{{ route('admin.opportunities') }}" class="flex items-center px-3 py-2 rounded-lg transition
                            {{ $currentUrl == route('admin.opportunities')
                ? 'bg-white text-[#001B4C] font-semibold shadow-sm'
                : 'text-white hover:bg-blue-800 hover:text-gray-100' }}">
                            <i class="fas fa-briefcase text-xl w-6 text-center"></i>
                            <span class="ml-2">Opportunities</span>
                        </a>
                    </li>
            @endif
            {{-- Sub Account --}}
            @if (is_role() == 'super_admin')
                    <li>
                        <a href="{{ route('admin.subaccount.index') }}" class="flex items-center px-3 py-2 rounded-lg transition
                                {{ $currentUrl == route('admin.subaccount.index')
                ? 'bg-white text-[#001B4C] font-semibold shadow-sm'
                : 'text-white hover:bg-blue-800 hover:text-gray-100' }}">
                            <i class="fa-solid fa-user text-xl w-6 text-center"></i>
                            <span class="ml-2">Sub Account</span>
                        </a>
                    </li>
            @endif

            {{-- Settings --}}
            @if (is_role() == 'super_admin' || is_role() == 'admin')
                    <li>
                        <a href="{{ route('admin.setting.index') }}" class="flex items-center px-3 py-2 rounded-lg transition
                                {{ $currentUrl == route('admin.setting.index')
                ? 'bg-white text-[#001B4C] font-semibold shadow-sm'
                : 'text-white hover:bg-blue-800 hover:text-gray-100' }}">
                            <i class="fas fa-cog text-xl w-6 text-center"></i>
                            <span class="ml-2">Settings</span>
                        </a>
                    </li>
            @endif

            {{-- Logout --}}
            <li>
                <a onclick="event.preventDefault(); document.getElementById('logout-form').submit();"
                    class="flex items-center px-3 py-2 rounded-lg transition text-white hover:bg-red-600 hover:text-white">
                    <i class="fas fa-sign-out-alt text-xl w-6 text-center"></i>
                    <span class="ml-2">Logout</span>
                </a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="hidden">@csrf</form>
            </li>
        </ul>
    </div>
</div>

<script>
    // function toggleMobileMenu() {
    //     document.getElementById("nav-links").classList.toggle("hidden");
    // }
</script>