<?php

namespace App\Http\Controllers;

use App\Models\AccessLevel;

class AccessLevelsController extends Controller
{

    public function __construct()
    {
    }

    public function get()
    {
        $access_levels = AccessLevel::get();

        return response()->json([
            'access_levels' => $access_levels,
        ]);
    }
}
