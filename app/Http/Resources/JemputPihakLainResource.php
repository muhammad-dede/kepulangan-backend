<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class JemputPihakLainResource extends JsonResource
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
            'bast_pihak_lain' => new BastPihakLainResource($this->whenLoaded('bast_pihak_lain')),
        ];
    }
}
