ALTER TABLE post ADD PRIMARY KEY (ps_postid);
ALTER TABLE forum ADD PRIMARY KEY (f_forumid);
ALTER TABLE forum_person ADD PRIMARY KEY (fp_forumid, fp_personid);
ALTER TABLE forum_tag ADD PRIMARY KEY (ft_forumid, ft_tagid);
ALTER TABLE organisation ADD PRIMARY KEY (o_organisationid);
ALTER TABLE person ADD PRIMARY KEY (p_personid);
ALTER TABLE person_email ADD PRIMARY KEY (pe_personid, pe_email);
ALTER TABLE person_tag ADD PRIMARY KEY (pt_personid, pt_tagid);
ALTER TABLE knows ADD PRIMARY KEY (k_person1id, k_person2id);
ALTER TABLE likes ADD PRIMARY KEY (l_postid, l_personid);
ALTER TABLE person_language ADD PRIMARY KEY (plang_personid, plang_language);
ALTER TABLE person_university ADD PRIMARY KEY (pu_personid, pu_organisationid);
ALTER TABLE person_company ADD PRIMARY KEY (pc_personid, pc_organisationid);
ALTER TABLE place ADD PRIMARY KEY (pl_placeid);
ALTER TABLE post_tag ADD PRIMARY KEY (pst_postid, pst_tagid);
ALTER TABLE tagclass ADD PRIMARY KEY (tc_tagclassid);
ALTER TABLE tag ADD PRIMARY KEY (t_tagid);

vacuum analyze;
-- Additional indexes (currently defined w/ Virtuoso syntax)
-- create index p_placeid on person (p_placeid) partition (p_placeid int);
-- create column index l_personid on likes (l_postid) partition (l_postid int (0hexffff00));
-- create index pl_containerplaceid on place (pl_containerplaceid) partition cluster REPLICATED;
-- create column index pst_tagid on post_tag (pst_tagid) partition (pst_tagid int (0hexffff00));

-- create index on foreign keys
-- TODO: other FK indexes to be added
CREATE INDEX forum_moderatorid ON forum (f_moderatorid);
CREATE INDEX forum_person_forumid ON forum_person (fp_forumid);
CREATE INDEX forum_person_personid ON forum_person (fp_personid);
CREATE INDEX forum_tag_forumid ON forum_tag (ft_forumid);
CREATE INDEX forum_tag_tagid ON forum_tag (ft_tagid);
CREATE INDEX knows_person1id ON knows (k_person1id);
CREATE INDEX knows_person2id ON knows (k_person2id);
CREATE INDEX likes_personid ON likes (l_personid);
CREATE INDEX likes_postid ON likes (l_postid);
CREATE INDEX organisation_placeid ON organisation (o_placeid);
CREATE INDEX person_placeid ON person (p_placeid);
CREATE INDEX person_company_personid ON person_company (pc_personid);
CREATE INDEX person_company_organisationid ON person_company (pc_organisationid);
CREATE INDEX person_email_personid ON person_email (pe_personid);
CREATE INDEX person_language_personid ON person_language (plang_personid);
CREATE INDEX person_tag_personid ON person_tag (pt_personid);
CREATE INDEX person_tag_tagid ON person_tag (pt_tagid);
CREATE INDEX person_university_personid ON person_university (pu_personid);
CREATE INDEX person_university_organisationid ON person_university (pu_organisationid);
CREATE INDEX place_containerplaceid ON place (pl_containerplaceid);
CREATE INDEX post_creatorid ON post (ps_creatorid);
CREATE INDEX post_locationid ON post (ps_locationid);
CREATE INDEX post_forumid ON post (ps_forumid);
CREATE INDEX post_replyof ON post (ps_replyof);
CREATE INDEX post_country ON post (ps_country);
CREATE INDEX post_tag_postid ON post_tag (pst_postid);
CREATE INDEX post_tag_tagid ON post_tag (pst_tagid);
CREATE INDEX tag_tagclassid ON tag (t_tagclassid);
CREATE INDEX tagclass_subclassoftagclassid ON tagclass (tc_subclassoftagclassid);
