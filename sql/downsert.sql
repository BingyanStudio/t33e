-- If exists, then do nothing, if not exists, then insert

-- MySQL
INSERT INTO `new`(`title`, `url`) SELECT "blabla", "www.google.com" WHERE NOT EXISTS (SELECT * FROM news WHERE news_id=181);
