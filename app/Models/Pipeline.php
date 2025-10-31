<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pipeline extends Model
{
    use HasFactory;

    protected $table = 'pipelines';

    // Fillable fields (for mass assignment)
    protected $fillable = [
        'location_id',
        'name',
        'pipeline_id',
    ];
    
  public function stages()
{
    return $this->hasMany(Stage::class, 'pipeline_id', 'id')
                ->with('stageLogs');
}
    public function stageLogs()
    {
        return $this->hasMany(StageChangeLog::class);
    }

    
}
