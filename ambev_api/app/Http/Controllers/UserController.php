<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

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
        $users = User::where('name', 'LIKE', '%' . $request->name . '%')->paginate($request->take);

        return response()->json([
            'users' => $users,
        ]);
    }

    public function edit($id, Request $request)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json(['message '=> 'Usuário não encontrado'], 401);
        }

        $data = [
            'name' => $request->name,
            'email' => $request->email,
            'username' => $request->username,
            'password' => $request->password,
            'access_level_id' => $request->access_level_id,
        ];

        if ($request->password == null) {
            unset($data['password']);
        }

        if (isset($request->password) && $request->password != '') {
            $data['password'] = Hash::make($request->password);
        }

        $user->update($data);

        return response()->json(['message' => 'User edit succcessfully.','user' => $user]);
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
