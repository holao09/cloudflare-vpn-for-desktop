# Link bài viết gốc của mình trên viblo.asia https://viblo.asia/p/huong-dan-su-dung-account-vpn-1111-cua-dien-thoai-len-pc-ByEZkQko5Q0
Hello everyone,
Cách đây một thời gian, mình đã từng chia sẻ một video hướng dẫn sử dụng VPN 1.1.1.1 trên PC với phần mềm Wireguard. Có một số câu hỏi như **Làm sao để sử dụng account 1.1.1.1 của điện thoại lên máy tính?**, **Làm sao điểm tra dung lượng còn lại cho account trên máy tính?**. Tại thời điểm đó thì mình chưa có câu trả lời vì mình không biết các APIs để truy vấn các thông tin đó. Tuy nhiên, cách đây một vài hôm, Cloudflare đã update APIs lên version mới và đã hỗ trợ các tính năng nói trên. Bây giờ, mình sẽ hướng dẫn cho các bạn cách để lấy account 1.1.1.1 trên điện thoại và đưa qua sử dụng trên máy tính
Ở bài chia sẻ này, chúng ta sẽ sử dụng repository này https://github.com/ViRb3/wgcf. Mình sẽ trả lời lần lượt từng câu hỏi trên:

# Làm sao để sử dụng account 1.1.1.1 của điện thoại lên máy tính?

## Tạo Repl workspace 
Vào trang https://repl.it/ -> Start coding -> BASH -> Create repl (Như hình minh họa)

![](https://images.viblo.asia/2946e5ee-8e39-4435-8aa4-d8c978757f1d.png)

## Download wgcf tool
Cửa sổ mới xuất hiện, gõ vào vùng màu đen (Terminal) bên phải dòng lệnh như bên dưới và Enter. Dòng lệnh chạy thành công, nhìn vào panel bên trái sẽ thấy có 1 file **wgcf** xuất hiện
``` BASH
wget -O wgcf https://github.com/ViRb3/wgcf/releases/download/v1.0.5/wgcf_1.0.5_linux_386; chmod +x wgcf
```

![](https://images.viblo.asia/b6533d57-e994-45c4-8c6a-19781a7ce652.png)

## Check tool syntax
Vậy là mình đã down được tool này về để chạy rồi. Tất cả các command được support có thể tham khảo ở repository chính thức của tool https://github.com/ViRb3/wgcf hoặc copy lệnh dưới vào terminal
``` BASH
./wgcf
```
 
![](https://images.viblo.asia/0aaf17e5-d8d1-42c6-9724-6eb6b4858534.png)

## Tạo tài khoản Cloudflare mới
Bây giờ, để thực hiện câu trả lời chính, mình sẽ đi các bước như sau: register -> Copy key từ điện thoại, set vào biến môi trường và chạy câu lệnh update -> chạy lệnh generate để tạo ra Profile của Wiguard -> Copy nội dung đó vào Tool Wireguard -> Xong. Mình sẽ làm các bước liên tục bằng các lệnh và ảnh minh họa. (copy lệnh dưới vào terminal)
``` BASH
./wgcf register
```
 
![](https://images.viblo.asia/45579127-bb44-4396-b969-ec50dece9ebe.png)

Sau khi chạy lệnh register, bạn sẽ phải chọn YES để accept TOS (Term of Services). Khi hoàn thành, sẽ có một file **wgcf-account.toml** xuất hiện bên trái, đây là file chứa thông tin account Cloudflare. Ở màn hình đen, bạn cũng sẽ thấy các thông số của account, gồm data còn lại, data đã dùng, loại account (pc/mobile), account type...
## Update license key 1.1.1.1 từ điện thoại vào account vừa được tạo
Đây là license key trên mobile của mình (mình xin cover nó lại để tránh bị dùng chung), danh sách devices đang sử dụng chung hiện tại chỉ có mỗi điện thoại của mình

![](https://images.viblo.asia/50df956c-deb7-4930-a71d-df885dd002f5.jpg)
![](https://images.viblo.asia/4184d7a2-ad0b-4bc5-a7dc-c183ca0ea6e2.jpg)

Bây giờ các bạn chạy lệnh (copy lệnh dưới vào terminal, thay thế giá trị của WGCF_LICENSE_KEY tương ứng với điện thoại của bạn )
``` BASH
WGCF_LICENSE_KEY="Điền license key từ điện thoại của bạn vào đây" ./wgcf update
```
Nếu thành công, sẽ hiện ra như sau

![](https://images.viblo.asia/535ae2ba-2c3d-4435-9321-c8e86a30b1de.png)

Check lại trên phần quản lý devices thì bạn cũng sẽ thấy có thêm ID mới. Trường hợp nếu lỗi ở đây, cái license key của bạn có vấn đề

![](https://images.viblo.asia/f54ce0d2-31b6-4b85-acdf-9829c5eae107.jpg)

## Tạo Wireguard Profile
Tới bước này rồi thì bạn chỉ cần tạo Wireguard Profile và xài trên máy tính thôi. Chạy lệnh tiếp theo (copy lệnh dưới vào terminal)

``` BASH
./wgcf generate
```
Khi chạy lệnh này, một file wgcf-profile.conf được sinh ra ở bên trái. Chọn file đó và copy tất cả nội dung của nó

![](https://images.viblo.asia/a09d0472-3b24-4d07-a462-f72d7f4fae1a.png)
![](https://images.viblo.asia/175c910a-d926-4c09-9806-5c3149784fa3.png)
![](https://images.viblo.asia/cb3c3221-2894-4890-bdc8-83c5c8494c0c.png)
![](https://images.viblo.asia/f6ba4b4d-eb24-4989-b0cb-aa83b6e10d88.png)

# Làm sao điểm tra dung lượng còn lại cho account trên máy tính?
Quá đơn giản, chỉ cần gõ 
``` BASH
./wgcf status
```

![](https://images.viblo.asia/1b661938-9050-417c-a0b1-626f97dd1a12.png)

Mình sẽ quay lại với bài viết hướng dẫn cách tăng dung lượng, đi sâu hơn tí về kĩ thuật :D
