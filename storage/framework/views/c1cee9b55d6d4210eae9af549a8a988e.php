<?php if($pipelines->count() > 0): ?>
<div class="space-y-6">
    <?php $__currentLoopData = $pipelines; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $pipelineId => $pipeline): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <div class="bg-white p-4 rounded-lg shadow mb-6">
        <h3 class="font-semibold text-gray-700 mb-2 text-lg">📊 Pipeline: <?php echo e($pipeline['name']); ?></h3>

        <?php $__currentLoopData = $pipeline['stages']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $stageId => $stage): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <div class="mb-4 ml-4">
            <h4 class="font-medium text-gray-600 mb-1 text-md">🚩 Stage: <?php echo e($stage['name']); ?></h4>
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200 text-sm mb-2 border border-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-4 py-2 text-left font-medium text-gray-600 border-b">Opportunity</th>
                            <th class="px-4 py-2 text-left font-medium text-gray-600 border-b">Entered At</th>
                            <th class="px-4 py-2 text-left font-medium text-gray-600 border-b">Left At</th>
                            <td class="px-4 py-2 text-left font-medium text-gray-600 border-b">Next Satge</td>
                            <th class="px-4 py-2 text-left font-medium text-gray-600 border-b">Time Spent</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        <?php $__empty_1 = true; $__currentLoopData = $stage['stageLogs']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $log): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                        <?php
                            $entered = $log->start_date ? \Carbon\Carbon::parse($log->start_date) : null;
                            $left = $log->end_date ? \Carbon\Carbon::parse($log->end_date) : null;
                            $timeSpent = $entered && $left ? $entered->diffForHumans($left, true)
                                        : ($entered ? 'In Progress' : '-');
                        ?>
                        <tr class="hover:bg-gray-50">
                            <td class="px-4 py-2 text-gray-800 border-b"><?php echo e($log->opportunity_name ?? '-'); ?></td>
                            <td class="px-4 py-2 text-gray-600 border-b"><?php echo e($entered?->format('Y-m-d H:i') ?? '-'); ?></td>
                            <td class="px-4 py-2 text-gray-600 border-b"><?php echo e($left?->format('Y-m-d H:i') ?? '-'); ?></td>
                             <td class="px-4 py-2 text-gray-600 border-b">
                                <?php if($log->next_stage_name): ?>
                                    → <strong><?php echo e($log->next_stage_name); ?></strong>
                                <?php endif; ?>
                            </td>
                            <td class="px-4 py-2 border-b <?php echo e($left ? 'text-gray-600' : 'text-blue-600 font-semibold'); ?>">
                                <?php echo e($timeSpent); ?>

                            </td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                        <tr>
                            <td colspan="4" class="px-4 py-2 text-gray-500 text-center border-b">No logs found for this stage</td>
                        </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
</div>
<?php else: ?>
<div class="text-center py-8 bg-white rounded-lg shadow">
    <p class="text-gray-500 text-lg">No stage history data available.</p>
</div>
<?php endif; ?><?php /**PATH /home/u878439255/domains/lightsalmon-boar-673636.hostingersite.com/public_html/resources/views/admin/partials/stage_history_table.blade.php ENDPATH**/ ?>