function estInt = intSimpsons(f, a, b)       
% burada değer döndüren bir fonksiyon oluşturduk output olarak estInt değişkenini oluşturduk 
% intSimpsons fonksiyonumuzda 3 adet parametremiz var bu parametreleri
% fonksiyonumuzu çağırırken simpsonsperform sayfasında yazacağız
 
                                             
estInt =((b-a)/6)*(f(a)+4*f((a+b)/2)+f(b));
% estInt outputunu bize verilen şekilde tanımlıyoruz
end
