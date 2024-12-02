class Doctor{
 final String image,name,specialist; //image
 final int price, id;
 final double rating; //buat rating doctor


 Doctor({
   required this.id,
   required this.name,
   required this.image,
   required this.specialist,
   required this.price,
   required this.rating,
 });


 static List<Doctor> doctors = [
   Doctor(
     id: 1,
     name: "Dr. Patricia Ahoy",
     image: "assets/images/dr-pat-ahoy.png",
     specialist: "Ear, Nose & Throat specialist",
     price: 120000,
     rating: 4.5
   ),
   Doctor(
     id: 1,
     name: "Dr. Stone Gaze",
     image: "assets/images/dr-stone-gaze.png",
     specialist: "Ear, Nose & Throat specialist",
     price: 120000,
     rating: 4.5
   ),
   Doctor(
     id: 1,
     name: "Dr. Wahyu",
     image: "assets/images/dr-wahyu.png",
     specialist: "Ear, Nose & Throat specialist",
     price: 120000,
     rating: 4.5
   ),
   Doctor(
     id: 1,
     name: "Dr. Reza Razor",
     image: "assets/images/dr-reza-razor.png",
     specialist: "Ear, Nose & Throat specialist",
     price: 120000,
     rating: 4.5
   ),
   Doctor(
     id: 1,
     name: "Dr. Jacky Cun",
     image: "assets/images/dr-jacky-cun.png",
     specialist: "Ear, Nose & Throat specialist",
     price: 120000,
     rating: 4.5
   ),
 ];
}