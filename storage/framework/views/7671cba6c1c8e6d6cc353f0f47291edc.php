<?php $__empty_1 = true; $__currentLoopData = $logs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $pipelineLogs): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
    <?php $__currentLoopData = $pipelineLogs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $log): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <tr class="hover:bg-gray-50">
            <td class="px-3 py-2 font-semibold"><?php echo e($log->pipeline_name ?? '-'); ?></td>
            <td class="px-3 py-2"><?php echo e($log->stage_name ?? '-'); ?></td>
            <td class="px-3 py-2"><?php echo e(\Carbon\Carbon::parse($log->logged_date)->format('d M Y')); ?></td>
            <td class="px-3 py-2 font-semibold"><?php echo e($log->opportunity_count); ?></td>
        </tr>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
    <tr>
        <td colspan="7" class="text-center py-4 text-gray-500">No records found.</td>
    </tr>
<?php endif; ?>
<?php /**PATH /home/u878439255/domains/lightsalmon-boar-673636.hostingersite.com/public_html/resources/views/admin/partials/opportunity_table_body.blade.php ENDPATH**/ ?>