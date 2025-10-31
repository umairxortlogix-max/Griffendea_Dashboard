<?php
    $modules = session('user_modules_' . auth()->id(), []);
    use Illuminate\Support\Facades\Route;

    $currentUrl = request()->url();
    $logo = App\Models\Setting::where('key', 'logo')->first();
?>

<div class="navbar fixed top-0 left-0 z-30 w-full bg-navy text-white shadow-md">
    <div class="flex items-center justify-between px-5 h-16 border-b border-gray-700">

        
        <a href="/" class="flex items-center space-x-2">
            <?php if($logo): ?>
                <img src="<?php echo e(asset('logo/' . $logo->value)); ?>" alt="Company Logo" class="w-10 h-10 object-contain">
            <?php else: ?>
                <span class="font-bold text-lg">MyApp</span>
            <?php endif; ?>
        </a>

        
        <button class="mobile-toggle text-white text-2xl md:hidden" onclick="toggleMobileMenu()">
            <i class="fas fa-bars"></i>
        </button>

        
        <ul id="nav-links" class="hidden md:flex flex-col md:flex-row items-start md:items-center 
                   absolute top-16 left-0 w-full bg-navy md:static md:bg-transparent 
                   md:w-auto md:space-x-6 z-50 transition-all duration-300 ease-in-out">

            
            <?php if(is_role() == 'super_admin'): ?>
                    <li>
                        <a href="<?php echo e(route('admin.dashboard')); ?>" class="flex items-center px-3 py-2 rounded-lg transition
                                <?php echo e($currentUrl == route('admin.dashboard')
                ? 'bg-white text-[#001B4C] font-semibold shadow-sm'
                : 'text-white hover:bg-blue-800 hover:text-gray-100'); ?>">
                            <i class="fas fa-home text-xl w-6 text-center"></i>
                            <span class="ml-2">Dashboard</span>
                        </a>
                    </li>
            <?php endif; ?>


            <?php if(is_role() == 'admin'): ?>

                    
                    <li>
                        <a href="<?php echo e(route('admin.opportunities')); ?>" class="flex items-center px-3 py-2 rounded-lg transition
                            <?php echo e($currentUrl == route('admin.opportunities')
                ? 'bg-white text-[#001B4C] font-semibold shadow-sm'
                : 'text-white hover:bg-blue-800 hover:text-gray-100'); ?>">
                            <i class="fas fa-briefcase text-xl w-6 text-center"></i>
                            <span class="ml-2">Dashboard</span>
                        </a>
                    </li>
            <?php endif; ?>
            
            <?php if(is_role() == 'super_admin'): ?>
                    <li>
                        <a href="<?php echo e(route('admin.subaccount.index')); ?>" class="flex items-center px-3 py-2 rounded-lg transition
                                <?php echo e($currentUrl == route('admin.subaccount.index')
                ? 'bg-white text-[#001B4C] font-semibold shadow-sm'
                : 'text-white hover:bg-blue-800 hover:text-gray-100'); ?>">
                            <i class="fa-solid fa-user text-xl w-6 text-center"></i>
                            <span class="ml-2">Sub Account</span>
                        </a>
                    </li>
            <?php endif; ?>

            
            <?php if(is_role() == 'super_admin' || is_role() == 'admin'): ?>
                    <li>
                        <a href="<?php echo e(route('admin.setting.index')); ?>" class="flex items-center px-3 py-2 rounded-lg transition
                                <?php echo e($currentUrl == route('admin.setting.index')
                ? 'bg-white text-[#001B4C] font-semibold shadow-sm'
                : 'text-white hover:bg-blue-800 hover:text-gray-100'); ?>">
                            <i class="fas fa-cog text-xl w-6 text-center"></i>
                            <span class="ml-2">Settings</span>
                        </a>
                    </li>
            <?php endif; ?>

            
            <li>
                <a onclick="event.preventDefault(); document.getElementById('logout-form').submit();"
                    class="flex items-center px-3 py-2 rounded-lg transition text-white hover:bg-red-600 hover:text-white">
                    <i class="fas fa-sign-out-alt text-xl w-6 text-center"></i>
                    <span class="ml-2">Logout</span>
                </a>
                <form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" class="hidden"><?php echo csrf_field(); ?></form>
            </li>
        </ul>
    </div>
</div>

<script>
    // function toggleMobileMenu() {
    //     document.getElementById("nav-links").classList.toggle("hidden");
    // }
</script><?php /**PATH /home/u878439255/domains/lightsalmon-boar-673636.hostingersite.com/public_html/resources/views/admin/layouts/sidebar.blade.php ENDPATH**/ ?>