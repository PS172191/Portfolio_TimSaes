<?php

namespace App\Http\Controllers;

use App\Models\Script;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ScriptController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // Indien er in de request een parameter genaamd sort zit, gebruikt hij die voor de orderBy in de query.
        if ($request->has('sort')) {
            return Script::orderBy($request->sort)->get();
        }

        // Indien er een limit en offset zijn meegegeven gebruikt hij die voor paginering.
        // In Laravel heet limit "take" en offset "skip.
        if ($request->has('limit') && $request->has('offset')){
            return Script::skip($request->offset)->take($request->limit)->get();
        }

        // Indien je in geen van beide ifjes gekomen bent, haalt hij standaard alle scripts op.
        return Script::All();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'bestand' => 'required',
            'naam' => 'required'
        ]);
        if ($validator->fails()) {
            //header('Content-Type: application/json');
            return response('{"Foutmelding":"Data niet correct"}', 400)->header('Content-Type', 'application/json');
        } else return Script::create($request->all());
    }

    /**
     * Display the specified resource.
     */
    public function show(Script $script)
    {
        return $script;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Script $script)
    {
        $script->update($request->all());
        return $script;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Script $script)
    {
        $script->delete();
    }

    public function indexHoofdstuk(Request $request, $id)
    {
        // Naast andere parameters, gebruikt deze functie ook het in de route meegegeven hoofdstuk_id voor een WHERE statement.
        if ($request->has('limit') && $request->has('offset')) {
            return Script::where('hoofdstuk_id',$id)->skip($request->offset)->take($request->limit)->get();
        }
        return Script::where('hoofdstuk_id',$id)->get();
    }

    public function destroyHoofdstuk($id)
    {
        Script::where('hoofdstuk_id', $id)->delete();
    }
}
