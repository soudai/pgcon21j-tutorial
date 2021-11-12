-- 欠勤table
CREATE TABLE 欠勤
(
  社員id INTEGER NOT NULL,
  欠勤日 DATE NOT NULL,
  理由 CHAR(40) NOT NULL,
  罰点 INTEGER NOT NULL
    CHECK (罰点 BETWEEN 0 AND 4),
  PRIMARY KEY(社員id, 欠勤日)
);

-- テストデータ作成
INSERT INTO 欠勤 SELECT (random() * 1000000)::int,
       (CURRENT_DATE - (random() * 100000)::int) AS date,
       理由,
       CASE 理由
           WHEN '病欠' THEN 0
           WHEN '有給' THEN 0
           WHEN '無断欠勤' THEN 4
           WHEN 'ロマサガ3の発売日' THEN 3
           ELSE 1
           END AS 罰点
FROM generate_series(1, 100000) AS id
         INNER JOIN
     (SELECT id,
             CASE ((random() * 10000)::int % 7)
                 WHEN 0 THEN '病欠'
                 WHEN 1 THEN '無断欠勤'
                 WHEN 2 THEN '有給'
                 WHEN 3 THEN 'ロマサガ3の発売日'
                 ELSE 'その他' END AS 理由
      FROM generate_series(1, 100000) AS id
     ) AS 理由
     USING (id)
;

