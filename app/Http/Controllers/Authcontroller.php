<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\users;


class Authcontroller extends Controller
{
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function Checkemail(Request $request)
    {
        $email = users::select('email')
            ->where('email', $request->email)
            ->get();
        count($email) > 0  ? $status = 201 : $status = 404;
        return response()->json([],$status);
    }
        /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function inscription(Request $request)
    {
        users::create([
            'name' => $request->name,
            'prénome' => $request->prénome,
            'age' => $request->age,
            'email' => $request->email,
            'password' => $request->password,
            'raisonsocial' => $request->raisonsocial,
        ]);

        return response()->json([],200);
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $user = users::where('email', $request->email)
        ->where('password', $request->password)
        ->get();

        count($user) > 0  ? $status = 201 : $status = 404;
        return response()->json([
            "user" => $user,
        ],$status);
    }

}
