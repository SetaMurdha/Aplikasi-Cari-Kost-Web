$(document).ready(()=>{
    $("input[name='filterKota']").change(()=>{
        $(".pilihKota").html("Kota / Kabupaten : "+($("input[name='filterKota']:checked").val()));
    });
    $("input[name='filterJenis']").change(()=>{
        $(".pilihJenis").html("Jenis : "+($("input[name='filterJenis']:checked").val()));
    });
    $("input[name='filterPembayaran']").change(()=>{
        $(".pilihPembayaran").html("Pembayaran : "+($("input[name='filterPembayaran']:checked").val()));
    });

    let uang = (nominal)=>{
        let number_string=nominal.toString();
        let sisa =number_string.length % 3;
        let rupiah=number_string.substr(0, sisa);
        let ribuan= number_string.substr(sisa).match(/\d{3}/g);

        if(ribuan){
            let separator = sisa ? '.':'';
            rupiah += separator + ribuan.join('.');
        }
        return rupiah;
    };

    let generateContainer = (id,nmkost,jenis,pembayaran,nm_kota_kab,harga,foto,alamat)=>{$(".container").append(`
    <a href="dashboard/detail/${id}">
    <div class="item mt-3">
        <div class="image">
            <img src="http://localhost/Aplikasi-Cari-Kost-Web/assets/img/gambar_kost/${foto}" width="350" alt="">
        </div>
        <div class="contents ml-2">
            <h1>${nmkost}</h1>
            <button class="btn btn-sm btn-success">${pembayaran}</button><button class="btn btn-sm ml-2 btn-success">${jenis}</button>
            <h3>${nm_kota_kab}</h3>
            <p>${alamat}.</p>
        </div>
        <div class="harga">
            <h3>Rp ${uang(harga)}</h3>
        </div>
    </div></a>`)};

    $("#searchBtn").click(function(){
        let filterKota = $("input[name='filterKota']:checked").val();
        let filterJenis = $("input[name='filterJenis']:checked").val();
        let filterPembayaran = $("input[name='filterPembayaran']:checked").val();
        let x =1;
        console.log($("#searchField").val());
        $.ajax({
            url : `http://localhost/Aplikasi-Cari-Kost-Web/administrator/dashboard/data_kost/${$("#searchField").val()}`,
            type : 'get',
            dataType : 'json',
            success : (result)=>{
                $(".container").html("");
                if(result==""){
                    $(".container").append(`<h1 style='margin-top:160px'>Not Found</h1>`);
                }else{
                $.each(result,function(i,e){
                    if(filterKota=="Semua" && filterJenis=="Semua" && filterPembayaran=="Semua"){
                        generateContainer(e.id,e.nmkost,e.jenis,e.pembayaran,e.nm_kota_kab,e.harga,e.foto,e.alamat);
                    }else if(filterKota==e.nm_kota_kab && filterJenis==e.jenis && filterPembayaran==e.pembayaran){
                        generateContainer(e.id,e.nmkost,e.jenis,e.pembayaran,e.nm_kota_kab,e.harga,e.foto,e.alamat);
                    }else if(filterKota=="Semua" && filterJenis==e.jenis && filterPembayaran==e.pembayaran){
                        generateContainer(e.id,e.nmkost,e.jenis,e.pembayaran,e.nm_kota_kab,e.harga,e.foto,e.alamat);
                    }else if(filterKota==e.nm_kota_kab && filterJenis=="Semua" && filterPembayaran==e.pembayaran){
                        generateContainer(e.id,e.nmkost,e.jenis,e.pembayaran,e.nm_kota_kab,e.harga,e.foto,e.alamat);
                    }else if(filterKota==e.nm_kota_kab && filterJenis==e.jenis && filterPembayaran=="Semua"){
                        generateContainer(e.id,e.nmkost,e.jenis,e.pembayaran,e.nm_kota_kab,e.harga,e.foto,e.alamat);
                    }else if(filterKota==e.nm_kota_kab && filterJenis=="Semua" && filterPembayaran=="Semua"){
                        generateContainer(e.id,e.nmkost,e.jenis,e.pembayaran,e.nm_kota_kab,e.harga,e.foto,e.alamat);
                    }else if(filterKota=="Semua" && filterJenis==e.jenis && filterPembayaran=="Semua"){
                        generateContainer(e.id,e.nmkost,e.jenis,e.pembayaran,e.nm_kota_kab,e.harga,e.foto,e.alamat);
                    }else if(filterKota=="Semua" && filterJenis=="Semua" && filterPembayaran==e.pembayaran){
                        generateContainer(e.id,e.nmkost,e.jenis,e.pembayaran,e.nm_kota_kab,e.harga,e.foto,e.alamat);
                    }
                });
                }
            }
        });
    });
})