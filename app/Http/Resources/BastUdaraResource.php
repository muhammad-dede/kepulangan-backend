<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BastUdaraResource extends JsonResource
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
            'purchase_order' => $this->purchase_order,
            'penyedia_jasa' => $this->penyedia_jasa,
            'alamat' => $this->alamat,
            'durasi_pengerjaan' => $this->durasi_pengerjaan,
            'tanggal_serah_terima' => $this->tanggal_serah_terima,
            'foto_penyedia_jasa' => $this->foto_penyedia_jasa,
            'foto_serah_terima' => $this->foto_serah_terima,
            'terlaksana' => $this->terlaksana,
            'user' => new UserResource($this->user),
            'udara' => UdaraResource::collection($this->whenLoaded('udara')),
            'spu' => $this->spu,
        ];
    }
}
