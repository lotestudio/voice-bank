<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserOrderResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'=>$this->id,
            'title'=>$this->title,
            'description'=>$this->description,
            'status_label'=>__('site.status').': '.$this->status->label($this),
            'status'=>$this->status->value,
            'completed_at'=>$this->completed_at?->format('d/m/Y') ?? 'N/A',
            'accepted_at'=>$this->completed_at?->format('d/m/Y') ?? 'N/A',
            'created_at'=>$this->created_at->format('d/m/Y'),
        ];
    }
}
