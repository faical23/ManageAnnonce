<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\users;
use Illuminate\Support\Facades\Hash;



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
        $user = users::create([
            'name' => $request->name,
            'prénome' => $request->prénome,
            'age' => $request->age,
            'email' => $request->email,
            'password' =>Hash::make($request->password),
            'raisonsocial' => $request->raisonsocial,
            'role'=>'user'
        ]);
        $token = $user->createToken('auth_token')->plainTextToken;
        return response()->json([
            "user" => $user,
            "token" =>$token
        ],200);
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $user = users::where('email', $request->email)->first();
        Hash::check($request->password, $user->password) ? $status = 200 : $status = 401;
        $status === 401 && $user = null;
        $user ? $token = $user->createToken('auth_token')->plainTextToken : $token = null;
        return response()->json([
            "user" => $user,
            "token" =>$token
        ],$status);
        }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        $request->user()->tokens()->delete(); //// ==> delete user token
        return response()->json([
            "Message" => "Logout",
        ]);
    }

}
