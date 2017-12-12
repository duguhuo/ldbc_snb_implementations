// Q18. How many persons have a given number of posts
/*
  :param {
    date: 20110721180000000,
    lengthThreshold: 20,
    languages: ['ar']
  }
*/
MATCH
  (person:Person)<-[:HAS_CREATOR]-(message:Message)-[:REPLY_OF*0..]->(post:Post)
WHERE message.content IS NOT NULL
  AND message.length < $lengthThreshold
  AND message.creationDate > $date
  AND post.language IN $languages
WITH
  person,
  count(message) AS messageCount
RETURN
  messageCount,
  count(person) AS personCount
ORDER BY
  personCount DESC,
  messageCount DESC
LIMIT 100