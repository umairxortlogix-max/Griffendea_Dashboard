  <div x-data="{ activeTab: 'overview' }"
            class="bg-gray-100 p-4 mb-4 rounded-lg shadow-md flex flex-col sm:flex-row sm:items-center sm:justify-between w-full">
            <div class="flex items-center gap-4 mb-3 sm:mb-0">

                <!-- 🟢 Tab Buttons (real links) -->
                <a href="<?php echo e(route('admin.opportunities')); ?>"
                    class="px-4 py-2 rounded-lg font-semibold shadow-sm border border-gray-300 transition-all
                                                                <?php echo e(request()->routeIs('admin.opportunities') ? 'bg-blue-600 text-white' : 'bg-white text-gray-800 hover:bg-gray-200'); ?>">
                    Opportunities Overview
                </a>

                <!-- <a href="<?php echo e(route('admin.opportunitiesTable')); ?>"
                                class="px-4 py-2 rounded-lg font-semibold shadow-sm border border-gray-300 transition-all
                                                                <?php echo e(request()->routeIs('admin.opportunitiesTable') ? 'bg-blue-600 text-white' : 'bg-white text-gray-800 hover:bg-gray-200'); ?>">
                                Conversion Table
                            </a> -->
                <a href="<?php echo e(route('admin.OpportunityStageHistory')); ?>"
                    class="px-4 py-2 rounded-lg font-semibold shadow-sm border border-gray-300 transition-all
                                                                                <?php echo e(request()->routeIs('admin.OpportunityStageHistory') ? 'bg-blue-600 text-white' : 'bg-white text-gray-800 hover:bg-gray-200'); ?>">
                    Opportunity Stage History</a>
                <a href="<?php echo e(route('admin.pipline.intake')); ?>"
                    class="px-4 py-2 rounded-lg font-semibold shadow-sm border border-gray-300 transition-all
                                                                                <?php echo e(request()->routeIs('admin.pipline.intake') ? 'bg-blue-600 text-white' : 'bg-white text-gray-800 hover:bg-gray-200'); ?>">
                    LeadIntake</a>

            </div>

            <!-- Optional: Right-side filters or dropdowns -->
            <div class="flex flex-col ml-0 sm:ml-96">
                <!-- Uncomment this section if needed later -->

            

            </div>
        </div><?php /**PATH /home/u878439255/domains/lightsalmon-boar-673636.hostingersite.com/public_html/resources/views/admin/partials/opportunityTab.blade.php ENDPATH**/ ?>