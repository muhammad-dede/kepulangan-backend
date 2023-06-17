<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class JenazahResource extends JsonResource
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
            'cargo' => $this->cargo,
            'foto_jenazah' => $this->foto_jenazah,
            'foto_paspor' => $this->foto_paspor,
            'foto_brafaks' => $this->foto_brafaks,
        ];
    }
}
