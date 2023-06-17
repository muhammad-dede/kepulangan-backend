<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DaratResource extends JsonResource
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
            'bast_darat' => new BastDaratResource($this->whenLoaded('bast_darat')),
            'foto_bast' => $this->foto_bast,
        ];
    }
}
