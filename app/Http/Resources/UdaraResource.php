<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UdaraResource extends JsonResource
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
            'bast_udara' => new BastUdaraResource($this->whenLoaded('bast_udara')),
            'foto_boarding_pass' => $this->foto_boarding_pass,
        ];
    }
}
