<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'nama' => $this->nama,
            'no_identitas' => $this->no_identitas,
            'jabatan' => $this->jabatan,
            'group' => $this->group,
            'telepon' => $this->telepon,
            'avatar' => $this->avatar,
            'qr_code' => $this->qr_code,
            'email' => $this->email,
            'role' => $this->roles->pluck('name')[0],
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
