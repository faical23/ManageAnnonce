<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;


class users extends Model
{
    use HasFactory;
    use HasApiTokens;
    protected $table = 'users';
    protected $fillable = [
        'name' ,
        'prénome',
        'age' ,
        'raisonsocial',
        'email',
        'password',
        'role'
    ];

        /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
    ];
}
