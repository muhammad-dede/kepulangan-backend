<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class JemputKeluargaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'kepulangan' => $this->kepulangan,
            'imigran' => new ImigranResource($this->whenLoaded('imigran')),
            'nama_penjemput' => $this->nama_penjemput,
            'hubungan_dengan_pmi' => $this->hubungan_dengan_pmi,
            'no_telp_penjemput' => $this->no_telp_penjemput,
            'tanggal_serah_terima' => $this->tanggal_serah_terima,
            'foto_penjemput' => $this->foto_penjemput,
            'foto_serah_terima' => $this->foto_serah_terima,
            'user' => new UserResource($this->user),
        ];
    }
}
