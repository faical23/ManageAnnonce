<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class galerie extends Model
{
    use HasFactory;
    protected $table = 'gallerie';
    protected $fillable = [
        'img' ,
        'annonce_id',
    ];
}
