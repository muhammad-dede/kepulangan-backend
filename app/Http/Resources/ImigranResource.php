<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ImigranResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return  [
            'id' => $this->id,
            'brafaks' => $this->brafaks,
            'paspor' => $this->paspor,
            'nama' => $this->nama,
            'jenis_kelamin' => $this->jenis_kelamin,
            'negara' => $this->negara,
            'sub_kawasan' => $this->sub_kawasan,
            'kawasan' => $this->kawasan,
            'alamat' => $this->alamat,
            'kab_kota' => $this->kab_kota,
            'provinsi' => $this->provinsi,
            'no_telp' => $this->no_telp,
            'jabatan' => $this->jabatan,
            // Pelayanan
            'area' => $this->area,
            'layanan' => $this->layanan,
            'tanggal_kedatangan' => $this->tanggal_kedatangan,
            'kepulangan' => $this->kepulangan,
            'terlaksana' => $this->terlaksana,
            'user' => new UserResource($this->user),
            // Biodata
            'pmi' => new PmiResource($this->pmi),
            'jenazah' => new JenazahResource($this->jenazah),
            // Kepulangan
            'darat' => new DaratResource($this->darat),
            'udara' => new UdaraResource($this->udara),
            'rujuk_rs_polri' => new RujukRsPolriResource($this->rujuk_rs_polri),
            'pulang_mandiri' => new PulangMandiriResource($this->pulang_mandiri),
            'jemput_keluarga' => new JemputKeluargaResource($this->jemput_keluarga),
            'jemput_pihak_lain' => new JemputPihakLainResource($this->jemput_pihak_lain),
            // Makan
            'makan' => MakanResource::collection($this->makan),
        ];
    }
}
