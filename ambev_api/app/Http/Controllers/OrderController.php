<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function get(Request $request)
    {
        $orders = Order::where('user_id', $request->user_id)->orderBy('created_at', 'desc')->get()->load('status', 'user');

        return response()->json([
            'error' => false,
            'orders' => $orders
        ]);
    }

    public function getFornecedor()
    {
        $orders = Order::where('status_id', 1)->orderBy('created_at', 'desc')->get()->load('user');

        return response()->json([
            'error' => false,
            'orders' => $orders
        ]);
    }

    public function getAnalista(Request $request)
    {
        if ($request->date != null) {
            $date_month = explode('-', $request->date)[1];
            $first_date = date($request->date);
            $last_date = date('Y-' . $date_month . '-t');
        }
        if ($request->type == 'pending') {
            $orders = Order::where('status_id', 2);

            if (isset($first_date) && isset($last_date)) {
                $orders = $orders->whereBetween('created_at', [$first_date, $last_date]);
            }

            $orders = $orders->orderBy('created_at', 'desc')
            ->get()
            ->load('user', 'status');
        } else {
            $orders = Order::whereIn('status_id', [3, 4]);

            if ($first_date && isset($fisrt_date) && $last_date && isset($last_date)) {
                $orders = $orders->whereBetween('created_at', [$first_date, $last_date]);
            }

            $orders = $orders->orderBy('created_at', 'desc')
            ->get()
            ->load('user', 'status');
        }

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
