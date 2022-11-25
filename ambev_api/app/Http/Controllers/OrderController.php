<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function get(Request $request)
    {
        $orders = Order::where('user_id', $request->user_id)->get()->load('status');

        return response()->json([
            'error' => false,
            'orders' => $orders
        ]);
    }

    public function getFornecedor()
    {
        $orders = Order::where('status_id', 1)->get()->load('user');

        return response()->json([
            'error' => false,
            'orders' => $orders
        ]);
    }

    public function update($id, Request $request)
    {
        $order = Order::find($id);

        $order->date = $request->date;
        $order->driver = $request->driver;
        $order->car = $request->car;
        $order->origin = $request->origin;
        $order->destiny = $request->destiny;
        $order->type = $request->type;
        $order->account = $request->account;
        $order->cost_center = $request->cost_center;
        $order->obs = $request->obs;
        $order->value = $request->value;
        $order->status_id = $request->status_id;
        $order->user_id = $request->user_id;

        $order->save();

        return response()->json([
            'error' => false,
            'order' => $order,
        ]);
    }

    public function store(Request $request)
    {
        $order = new Order;
        $order->date = $request->date;
        $order->driver = $request->driver;
        $order->car = $request->car;
        $order->origin = $request->origin;
        $order->destiny = $request->destiny;
        $order->type = $request->type;
        $order->account = $request->account;
        $order->cost_center = $request->cost_center;
        $order->obs = $request->obs;
        $order->value = $request->value;
        $order->status_id = $request->status_id;
        $order->user_id = $request->user_id;

        $order->save();

        return response()->json([
            'error' => false,
            'order' => $order,
        ]);
    }
}
