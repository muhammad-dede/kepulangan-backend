<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BastPihakLainResource extends JsonResource
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
            'pihak_kedua' => $this->pihak_kedua,
            'tanggal_serah_terima' => $this->tanggal_serah_terima,
            'foto_pihak_kedua' => $this->foto_pihak_kedua,
            'foto_serah_terima' => $this->foto_serah_terima,
            'terlaksana' => $this->terlaksana,
            'user' => new UserResource($this->user),
            'jemput_pihak_lain' => JemputPihakLainResource::collection($this->whenLoaded('jemput_pihak_lain')),
        ];
    }
}
