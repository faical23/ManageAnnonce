<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class annonces extends Model
{
    use HasFactory;
    protected $table = 'annonce';
    protected $fillable = [
        'titre' ,
        'adress',
        'description',
        'nomDeAnnonce',
        'télephone',
        'whatssap',
        'user_id',
        'isApprove'
    ];
}
