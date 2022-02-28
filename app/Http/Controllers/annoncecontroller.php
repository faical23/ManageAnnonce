<?php

namespace App\Http\Controllers;

use App\Models\annonces;
use App\Models\galerie;
use App\Models\users;
use Illuminate\Http\Request;
use App\Mail\Contact;
use Illuminate\Support\Facades\Mail;


class annoncecontroller extends Controller
{
    public function __construct()
    {
        $this->middleware("auth:sanctum", [
            "except" => ['index','show','lastannonce','Searchannonce','SendEmail','getAnnonceForAdmine']
        ]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $annonces = annonces::where('isApprove',1)->get();
        return response()->json([
            "annonces" => $annonces,
        ],200);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getAnnonceForAdmine()
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
        $annonces = annonces::where('id',$id)->first();
        $ImgAnnonce = galerie::where('annonce_id',$annonces->id)->get();
        $User = users::where('id',$annonces->user_id)->get();

        $collectionImg = [];
        for ($i = 0; $i < count($ImgAnnonce); $i++){
            array_push($collectionImg,$ImgAnnonce[$i]);
        }
        return response()->json([
            "annonces" => $annonces,
            "Images" => $collectionImg,
            "User" =>$User
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
        $annonce = annonces::create([
            'user_id' => auth()->user()->id,
            'nomDeAnnonce' => auth()->user()->name,
            'titre' => $request->titre,
            'adress' => $request->adress,
            'télephone' => $request->phone,
            'whatssap' => $request->whatssap,
            'description' => $request->description,
            'isApprove' => 0,
        ]);


            foreach ($request->file('files') as $file) {
                $imgoriginname = $file->getClientOriginalName();
                $name = time().'_'.$imgoriginname;
                $upload_path = public_path().'/images/annonceImg';
                $file->move($upload_path,$name);
                $ImgToDb = 'images/annonceImg/' .$name;
                galerie::create([
                    'annonce_id' => $annonce->id,
                    'img' => $ImgToDb
                ]);
            }

        return response()->json(["Announce" => $annonce],201);

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
        $annonce = annonces::where('id',$id)->get();
        $annonce[0]->isApprove === 0 ? annonces::where("id", $id)->update(['isApprove'=> 1]) : annonces::where("id", $id)->update(['isApprove'=> 0]) ;
        return response()->json([$annonce[0]->isApprove],200);
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
        $annonces = annonces::where('isApprove',1)->limit($id)->get();
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
                /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function userAnnonce($id)
    {
        $annonces = annonces::where('user_id',$id)
                                ->get();
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
    public function SendEmail(Request $request)
    {
            $details  =[
                "name"=> $request->name,
                "email"=> $request->email,
                "phone"=> $request->phone,
                "content"=> $request->comment,
            ];
            Mail::to('bahsisfaical@gmail.com')->send(new Contact($details));
            return response()->json([
                "status" => "success",
            ],200);
    }



}
