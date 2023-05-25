<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hoofdstuk extends Model
{
    protected $table = 'hoofdstukken';
    protected $fillable = ['naam'];
    public $timestamps = false;
}
