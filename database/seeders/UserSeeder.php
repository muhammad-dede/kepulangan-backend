<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role_admin = Role::create([
            'name' => 'Admin',
        ]);

        $role_petugas = Role::create([
            'name' => 'Petugas',
        ]);

        $admin = User::create([
            'nama' => 'Administrator',
            'no_identitas' => '0000000000000000',
            'jabatan' => 'Administrator',
            'id_group' => 1,
            'telepon' => '081111111111',
            'avatar' => 'https://ui-avatars.com/api/?name=a-dmin',
            'qr_code' => asset('public/petugas/1'),
            'email' => 'admin@email.com',
            'password' => bcrypt('password'),
        ]);
        $admin->assignRole($role_admin);

        $petugas = User::create([
            'nama' => 'Petugas',
            'no_identitas' => '1111111111111111',
            'jabatan' => 'Petugas',
            'id_group' => 2,
            'telepon' => '082222222222',
            'avatar' => 'https://ui-avatars.com/api/?name=petugas',
            'qr_code' => asset('public/petugas/2'),
            'email' => 'petugas@email.com',
            'password' => bcrypt('password'),
        ]);
        $petugas->assignRole($role_petugas);
    }
}
