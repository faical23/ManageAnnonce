<?php

namespace App\Http\Controllers;

use App\Models\annonces;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class annoncecontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $annonces = annonces::get();
        return response()->json([
            "annonces" => $annonces,
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
        $annonces = annonces::where('id',$id)->get();
        return response()->json([
            "annonces" => $annonces,
        ],200);
    }

        /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $annonces  = annonces::create([
            'user_id' => 3,
            'titre' => $request->titre,
            'adress' => $request->adress,
            'description' => $request->description,
            'nomDeAnnonce' => $request->nomDeAnnonce,
            'télephone' => $request->télephone,
            'whatssap' => $request->whatssap,
            'isApprove'=> 0
        ]);

        return response()->json(["Announce" => $annonces],201);

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
        annonces::where("id", $id)
         ->update([
            'user_id' => 3,
            'titre' => $request->titre,
            'adress' => $request->adress,
            'description' => $request->description,
            'nomDeAnnonce' => $request->nomDeAnnonce,
            'télephone' => $request->télephone,
            'whatssap' => $request->whatssap,
            'isApprove'=> 0
        ]);
        return response()->json([],200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function ApproceAnnonce(Request $request, $id)
    {
        annonces::where("id", $id)
         ->update([
            'isApprove'=> 1
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
        annonces::where('id',$id)->delete();
        return response()->json([],200);
    }
            /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function lastannonce($id)
    {
        $annonces = annonces::limit($id)->get();
        return response()->json([
            "annonces" => $annonces,
        ],200);
    }
            /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function Searchannonce($titre)
    {
        $annonces = annonces::where('titre', 'like', $titre.'%')
                                ->get();
        return response()->json([
            "annonces" => $annonces,
        ],200);
    }
}
