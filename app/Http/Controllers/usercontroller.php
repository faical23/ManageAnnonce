<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\users;
use auth;



class usercontroller extends Controller
{
    public function __construct()
    {
        $this->middleware("auth:sanctum", []);
   }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = users::where('role','user')->get();
        return response()->json([
            "user" => $user,
        ],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = users::where('id',$id)->get();
        return response()->json([
            "user" => $user,
        ],200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        users::where("id", $id)
        ->update([
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
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        users::where('id',$id)->delete();
        return response()->json([],200);
    }

    public function LoadData()
    {
        return auth()->user();
    }

}
