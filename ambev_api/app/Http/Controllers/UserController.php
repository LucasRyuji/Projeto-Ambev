<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{

    public function __construct()
    {
    }

    public function delete($id)
    {
        $user = User::findOrFail($id);

        $user->delete();

        return response()->json([
            'error' => false,
        ]);
    }

    public function paginate(Request $request)
    {
        $users = User::paginate($request->take);

        return response()->json([
            'users' => $users,
        ]);
    }

    public function create(Request $request)
    {
        $user = User::where('username', $request->username)->first();
        if(!$user){
            $user = new User();
            $user->username = $request->username;
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = bcrypt($request->password);
            $user->access_level_id = $request->access_level_id;
            $user->active = 1;
            $user->save();

            return response()->json(['message' => 'User created succcessful.','user' => $user]);
        }else{
            return response()->json(['message '=> 'Nome de Usuário já está em uso'], 401);
        }
    }
}
