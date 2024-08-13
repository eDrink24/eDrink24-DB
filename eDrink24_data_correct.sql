-- 1. 레드와인, 화이트와인, 스파클링와인, 로제와인에 대해 category1을 '와인'으로 업데이트
UPDATE product
SET category1 = '와인'
WHERE category1 = '와인/양주' 
  AND category2 IN ('레드와인', '화이트와인', '스파클링와인', '로제와인');

-- 2. category2가 '양주'인 경우 category1을 '양주'로 업데이트
UPDATE product
SET category1 = '양주'
WHERE category1 = '와인/양주'
  AND category2 = '양주';

UPDATE product
SET category2 = '무알콜맥주|칵테일'
WHERE category1 = '논알콜'
AND category2 = '무알콜맥주/칵테일';

ALTER TABLE dibs
ADD CONSTRAINT unique_user_product UNIQUE (userId, productId);

commit;
