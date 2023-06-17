<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PmiResource extends JsonResource
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
            'imigran' => new ImigranResource($this->whenLoaded('imigran')),
            'group' => $this->group,
            'masalah' => $this->masalah,
            'foto_pmi' => $this->foto_pmi,
            'foto_paspor' => $this->foto_paspor,
        ];
    }
}
