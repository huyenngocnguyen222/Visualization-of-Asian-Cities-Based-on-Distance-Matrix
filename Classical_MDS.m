function Location = Classical_MDS()

% Data matrix 5x5
P = csvread('Data5.csv');

% Binh phuong tung phan tu cua ma tran
P2 = P.^2;
% Tinh ma tran J
J = eye(5) - (5^-1)*ones(5);
% Tinh ma tran B
B = -0.5 * J * P2 * J;
% Tinh vecto rieng va tri rieng cua B
[eigen_vectors, eigen_values] = eig(B);
% Chon so chieu la 2 nen lay 2 vecto rieng troi va hai tri rieng troi
Em = eigen_vectors(:, [1, 2]);
Ln = eigen_values(1:2,1:2);
% Tinh ma tran X la toa do cua cac thanh pho
X = Em * (Ln.^0.5);
disp(X);
scatter(X(:, 1), X(:, 2), 'filled');
text(X(:, 1), X(:, 2), {'Ho Chi Minh city', 'Bangkok', 'Seoul', 'Tokyo', 'Phnom Penh'});

% Đặt tên cho trục và tiêu đề biểu đồ
xlabel('Dimension 1');
ylabel('Dimension 2');
title('Biểu đồ tương quan 2 chiều các thành phố');
end