<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

/**
 * Class User
 *
 * @property int $id
 * @property string $name
 * @property string|null $email
 * @property string $username
 * @property string $password
 * @property bool $active
 * @property int $access_level_id
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @property string|null $deleted_at
 *
 * @package App\Models
 */
class User extends Authenticatable implements JWTSubject
{
    use SoftDeletes;
    use Notifiable;

    protected $table = 'users';

    protected $casts = [
        'active' => 'bool',
    ];

    protected $hidden = [
        'password',
    ];

    protected $fillable = [
        'name',
        'email',
        'username',
        'password',
        'active',
        'access_level_id',
    ];

    public function access_level()
    {
        return $this->belongTo(AccessLevel::class, 'access_level_id');
    }

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }
}
