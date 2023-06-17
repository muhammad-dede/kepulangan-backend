<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class MakanResource extends JsonResource
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
            'imigran' => new ImigranResource($this->whenLoaded('imigran')),
            'bast_makan' => new BastMakanResource($this->whenLoaded('bast_makan')),
        ];
    }
}
