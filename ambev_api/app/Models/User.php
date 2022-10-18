<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
/**
 * Class User
 * 
 * @property int $id
 * @property string $name
 * @property string|null $email
 * @property string $username
 * @property string $password
 * @property bool $active
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
		'active' => 'bool'
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
	];

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

