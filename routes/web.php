<?php

use App\Http\Controllers\Admin\AnnouncementController;
use App\Http\Controllers\Admin\CompanysettingController;
use App\Http\Controllers\Admin\ContactbuttonController;
use App\Http\Controllers\Admin\CustommenuController;
use App\Http\Controllers\Admin\CustommenulinkController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\DatauseroptionController;
use App\Http\Controllers\Admin\FolderController;
use App\Http\Controllers\Admin\LocationController;
use App\Http\Controllers\Admin\LocationcustomizerController;
use App\Http\Controllers\Admin\MenuController;
use App\Http\Controllers\Admin\PermissionController;
use App\Http\Controllers\Admin\RenamemenuController;
use App\Http\Controllers\Admin\ScriptpermController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\SettingsController;
use App\Http\Controllers\Admin\SubmenuController;
use App\Http\Controllers\Admin\TranslationController;
use App\Http\Controllers\Admin\OpportuniteIntake;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\UseroptionController;
use App\Http\Controllers\AutoAuthController;
use App\Http\Controllers\CRMController;
use App\Http\Controllers\SubAccountController;
use App\Http\Controllers\CustomValueController;
use App\Models\UserPermission;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\WebhookController;

use Illuminate\Support\Facades\Artisan;
use League\CommonMark\Extension\SmartPunct\DashParser;
use SebastianBergmann\CodeCoverage\Report\Html\Dashboard;

Route::get('/', function () {
    return view('auth.login');
});
Route::post('/login', [UserController::class, 'login'])->name('login');
Route::get('/db-test', function () {
    try {
        \DB::connection()->getPdo();
        return 'Database connection successful!';
    } catch (\Exception $e) {
        return 'Error: ' . $e->getMessage();
    }
});
// Utility Routes
Route::get('flowbite', fn() => view('welcome'));
Route::get('/cache', function () {
    Artisan::call('config:clear');
    Artisan::call('optimize:clear');
    Artisan::call('route:clear');
    Artisan::call('view:clear');
    Artisan::call('cache:clear');
    return '<h3>Caches have been cleared successfully!</h3>';
});


// Auth-protected route for both roles
Route::group(['as' => 'admin.', 'prefix' => 'admin', 'middleware' => ['auth']], function () {

    Route::middleware('role_check:1,2')->group(function () {
        Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
        Route::get('/contacts', [DashboardController::class, 'contacts'])->name('contacts');
        Route::get('/opportunities', [DashboardController::class, 'opportunities'])->name('opportunities');


        Route::get('/dashboard/data', [DashboardController::class, 'getDashboardData'])->name('dashboard.data');
        Route::get('/dashboard/piplinesData', [DashboardController::class, 'piplinesData'])->name('piplinesData');
        Route::get('/singlePiplineStageConversion', [DashboardController::class, 'singlePiplineStageConversion'])->name('singlePiplineStageConversion');
        Route::get('/dashboard/pipelineStageDistribution', [DashboardController::class, 'pipelineStageDistribution'])->name('pipelineStageDistribution');
        Route::get('/dashboard/updateAllCharts', [DashboardController::class, 'updateAllCharts'])->name('updateAllCharts');
        Route::get('/dashboard/opportunitiesStatusPieChartopportunitiesStatusPieChart', [DashboardController::class, 'opportunitiesStatusPieChart'])->name('opportunitiesStatusPieChart');
        Route::get('/dashboard/pipelineVelocity', [DashboardController::class, 'pipelineVelocity'])->name('pipelineVelocity');
        Route::post('/get-pipeline-stages', [DashboardController::class, 'getPipelineStages'])->name('pipeline.stages');
        Route::get('/dashboard/opportunitiesTable', [DashboardController::class, 'opportunitiesTable'])->name('opportunitiesTable');
        Route::get('/dashboard/OpportunityStageHistory', [DashboardController::class, 'OpportunityStageHistory'])->name('OpportunityStageHistory');
// Route::post('get-pipeline-stages', [DashboardController::class, 'getPipelineStages'])
//     ->name('get-pipeline-stages');
        Route::get('dashboard/pipline-intake', [OpportuniteIntake::class, 'index'])->name('pipline.intake');
        // Route::get('admin/dashboard/lead-intake-stats', [DashboardController::class, 'leadIntakeStats'])
        //     ->name('admin.dashboard.lead-intake-stats');
        Route::get('lead-intake-stats', [OpportuniteIntake::class, 'getLeadIntakeStats'])
            ->name('lead-intake-stats');

        Route::get('/dashboard/appointments', [DashboardController::class, 'appointments'])->name('appointments');
        Route::get('/dashboard/appointmentsData', [DashboardController::class, 'appointmentsData'])->name('appointmentsData');
        Route::get('/dashboard/appointmentChartUpdate', [DashboardController::class, 'appointmentChartUpdate'])->name('appointmentChartUpdate');
        Route::get('/dashboard/userAppointmentsChart', [DashboardController::class, 'userAppointmentsChart'])->name('userAppointmentsChart');
        Route::get('/dashboard/appointmentsByYear', [DashboardController::class, 'appointmentsByYear'])->name('appointmentsByYear');
        Route::get('/dashboard/updateAllAppointmentCharts', [DashboardController::class, 'updateAllAppointmentCharts'])->name('updateAllAppointmentCharts');





        Route::get('/dashboard/invoices', [DashboardController::class, 'invoices'])->name('invoices');
        Route::get('/dashboard/invoicesData', [DashboardController::class, 'invoicesData'])->name('invoicesData');
        Route::get('/dashboard/invoicesByYear', [DashboardController::class, 'invoicesByYear'])->name('invoicesByYear');
        Route::get('/dashboard/monthlyInvoiceAmount', [DashboardController::class, 'monthlyInvoiceAmount'])->name('monthlyInvoiceAmount');
        Route::get('/dashboard/updateAllInvoicesCharts', [DashboardController::class, 'updateAllInvoicesCharts'])->name('updateAllInvoicesCharts');
        Route::get('/dashboard/invoiceChartUpdate', [DashboardController::class, 'invoiceChartUpdate'])->name('invoiceChartUpdate');


        Route::prefix('user')->name('user.')->group(function () {
            Route::get('index', [UserController::class, 'index'])->name('index');
            Route::post('store/{id?}', [UserController::class, 'store'])->name('store');
            Route::get('/edit/{id}', [UserController::class, 'edit'])->name('edit');
            Route::get('/profile', [UserController::class, 'profile'])->name('profile');
            Route::post('/password-save', [UserController::class, 'changePassword'])->name('password.save');
            Route::post('/email-change', [UserController::class, 'changeEmail'])->name('email.save');
            Route::get('/status/{id?}', [UserController::class, 'status'])->name('status');
            Route::delete('delete/{id}', [UserController::class, 'destroy'])->name('destroy');
            Route::post('/profile-save', [UserController::class, 'general'])->name('profile.save');
            Route::post('/image', [UserController::class, 'imageUpload'])->name('imageUpload');
        });

        Route::prefix('setting')->name('setting.')->group(function () {
            Route::get('/index', [SettingController::class, 'index'])->name('index');
            Route::post('/save', [SettingController::class, 'save'])->name('save');
            Route::post('settings/logo', [SettingController::class, 'saveLogo'])->name('saveLogo');
        });
    });

    Route::middleware(['auth', 'super_admin'])->group(function () {
        Route::prefix('sub-account')->name('subaccount.')->group(function () {
            Route::get('/index', [SubAccountController::class, 'index'])->name('index');
            Route::post('/policies', [SubAccountController::class, 'policies'])->name('policies');
            Route::get('/user/search', [SubAccountController::class, 'searchUserByAjax'])->name('user.search');
        });

        Route::prefix('log')->name('logs.')->group(function () {
            Route::get('/index', [SettingController::class, 'log'])->name('index');
        });


    });



    Route::middleware(['auth', 'admin'])->group(function () {
        // Route::get('/announcement/index', [AnnouncementController::class, 'index'])->name('announcement.index');
        // Route::get('/translation/index', [TranslationController::class, 'index'])->name('translation.index');
        // Route::get('/location/index', [LocationController::class, 'index'])->name('location.index');
        // Route::get('/user/index', [UserController::class, 'index'])->name('user.index');
        // Route::get('/folder/index', [FolderController::class, 'index'])->name('folder.index');
        // Route::get('/datauseroption/index', [DatauseroptionController::class, 'index'])->name('datauseroption.index');
        // Route::get('/submenu/index', [SubmenuController::class, 'index'])->name('submenu.index');
        // Route::get('/locationcustomizer/index', [LocationcustomizerController::class, 'index'])->name('locationcustomizer.index');
        // Route::get('/useroption/index', [UseroptionController::class, 'index'])->name('useroption.index');
        // Route::get('/contactbutton/index', [ContactbuttonController::class, 'index'])->name('contactbutton.index');
        // Route::get('/custommenu/index', [CustommenuController::class, 'index'])->name('custommenu.index');
        // Route::get('/custommenulink/index', [CustommenulinkController::class, 'index'])->name('custommenulink.index');
        // Route::get('/companysetting/index', [CompanysettingController::class, 'index'])->name('companysetting.index');
        // Route::get('/settings/index', [SettingsController::class, 'index'])->name('settings.index');
        // Route::get('/scriptperm/index', [ScriptpermController::class, 'index'])->name('scriptperm.index');
        // Route::get('/permi   ssion/index', [PermissionController::class, 'index'])->name('permission.index');
        // Route::get('/menu/index', [MenuController::class, 'index'])->name('menu.index');
        // //Rename Menu Routes
        // Route::get('/renamemenu/index', [RenamemenuController::class, 'index'])->name('renamemenu.index');
        // Route::post('/renamemenu/index', [RenamemenuController::class, 'store'])->name('renamemenu.store');


    });
});




// These routes need auth before super_admin
Route::middleware(['auth', 'super_admin'])->group(function () {
    Route::get('/loginwith/{id}', function ($id) {
        $user = \App\Models\User::findOrFail($id);

        if ($user) {
            $currentUser = Auth::user();

            if (in_array($currentUser->role, [1, 2])) {
                if ($user->role == 2) {
                    session()->put('super_admin', $currentUser);
                } else {
                    session()->put('company_admin', $currentUser);
                }

                Auth::loginUsingId($user->id);
            }
        }

        return redirect()->intended('/admin/opportunities');
    })->name('admin.user.autoLogin');
});


// // These routes need auth before super_admin
// Route::middleware(['auth', 'super_admin'])->group(function () {
//     Route::get('/loginwith/{id}', function ($id) {
//         $user = \App\Models\User::findOrFail($id);
//         $allowedModules = UserPermission::where('user_id', $user->id)
//             ->pluck('module')
//             ->unique()
//             ->toArray();

//         session()->forget('user_modules_' . $user->id);
//         session()->put('user_modules_' . $user->id, $allowedModules);
//         if ($user) {
//             $currentUser = Auth::user();

//             if (in_array($currentUser->role, [1, 2])) {
//                 if ($user->role == 2) {
//                     session()->put('super_admin', $currentUser);
//                 } else {
//                     session()->put('company_admin', $currentUser);
//                 }

//                 Auth::loginUsingId($user->id);
//             }
//         }
//         return redirect()->intended('admin/dashboard');
//     })->name('admin.user.autoLogin');
// });
Route::get('/backtoadmin', function () {
    if (request()->has('admin') && session()->has('super_admin')) {
        Auth::login(session('super_admin'));
        session()->forget(['super_admin', 'company_admin']);
    } elseif (request()->has('company') && session()->has('company_admin')) {
        Auth::login(session('company_admin'));
        session()->forget('company_admin');
    } else {
        return redirect()->route('login')->withErrors('No admin session available.');
    }
    return redirect()->intended('/admin/dashboard');
})->name('backtoadmin');
// CRM & OAuth Routes
Route::prefix('authorization')->name('crm.')->group(function () {
    Route::middleware('auth')->group(function () {
        Route::get('/crm/fetch_detail', [CRMController::class, 'crmFetchDetail'])->name('fetchDetail');
        Route::get('/crm/fetchLocations', [CRMController::class, 'fetchLocations'])->name('fetchLocations');
        Route::get('/crm/fetchUser', [CRMController::class, 'fetchUsers'])->name('fetchUser');
        Route::get('/crm/syn/location/data', [CRMController::class, 'synLocationData'])->name('syn.location.data');
    });
    Route::get('/crm/oauth/callback', [CRMController::class, 'crmCallback'])->name('oauth_callback');
});

Route::post('/import-leads', [CRMController::class, 'saveFromJson'])->name('uploadChunks');
Route::get('/conversion-stats', [CRMController::class, 'getPipelineConversionStats'])->name('conversion.stats');



// Auth handling
// Route::get('check/auth', [AutoAuthController::class, 'connect'])->name('auth.check');
// Route::get('check/auth/error', [AutoAuthController::class, 'authError'])->name('error');
// Route::get('checking/auth', [AutoAuthController::class, 'authChecking'])->name('admin.auth.checking');

Auth::routes();
