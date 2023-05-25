<?php

namespace App\Http\Controllers;

use App\Models\Hoofdstuk;
use Illuminate\Http\Request;

class HoofdstukController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Hoofdstuk::All();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        return Hoofdstuk::create($request->all());
    }

    /**
     * Display the specified resource.
     */
    public function show(Hoofdstuk $hoofdstuk)
    {
        return $hoofdstuk;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Hoofdstuk $hoofdstuk)
    {
        $hoofdstuk->update($request->all());
        return $hoofdstuk;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Hoofdstuk $hoofdstuk)
    {
        $hoofdstuk->delete();
    }
}
