PGDMP  !    !                }            Valuedx_Training_App    16.3    16.3 �    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            3           1262    24724    Valuedx_Training_App    DATABASE     �   CREATE DATABASE "Valuedx_Training_App" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
 &   DROP DATABASE "Valuedx_Training_App";
                postgres    false            	           1259    25430    absentee_notifications    TABLE        CREATE TABLE public.absentee_notifications (
    id integer NOT NULL,
    student_id character varying,
    student_name character varying(100),
    batch_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    seen boolean DEFAULT false
);
 *   DROP TABLE public.absentee_notifications;
       public         heap    postgres    false                       1259    25429    absentee_notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.absentee_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.absentee_notifications_id_seq;
       public          postgres    false    265            4           0    0    absentee_notifications_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.absentee_notifications_id_seq OWNED BY public.absentee_notifications.id;
          public          postgres    false    264            �            1259    24725    access_card_details    TABLE     �  CREATE TABLE public.access_card_details (
    id integer NOT NULL,
    trainee_code character varying(50),
    trainee_name character varying(100),
    email character varying(100),
    contact character varying(15),
    id_card_type character varying(50),
    access_card_number character varying(50),
    card_allocation_date date,
    training_duration character varying(50),
    trainer_name character varying(100),
    manager_name character varying(100),
    card_submitted_date date,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deposit text
);
 '   DROP TABLE public.access_card_details;
       public         heap    postgres    false            �            1259    24732    access_card_details_id_seq    SEQUENCE     �   CREATE SEQUENCE public.access_card_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.access_card_details_id_seq;
       public          postgres    false    215            5           0    0    access_card_details_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.access_card_details_id_seq OWNED BY public.access_card_details.id;
          public          postgres    false    216            �            1259    24733    achievements    TABLE     �   CREATE TABLE public.achievements (
    id integer NOT NULL,
    profile_id character varying,
    award_name character varying(255),
    issuing_organization character varying(255),
    award_date date
);
     DROP TABLE public.achievements;
       public         heap    postgres    false            �            1259    24738    achievements_id_seq    SEQUENCE     �   CREATE SEQUENCE public.achievements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.achievements_id_seq;
       public          postgres    false    217            6           0    0    achievements_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.achievements_id_seq OWNED BY public.achievements.id;
          public          postgres    false    218                       1259    25723    aptitude_result    TABLE       CREATE TABLE public.aptitude_result (
    id character varying NOT NULL,
    aptitude_marks integer,
    percentage numeric(5,2),
    result text,
    created_by_role text,
    created_by_userid text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.aptitude_result;
       public         heap    postgres    false            �            1259    25314 
   attendance    TABLE     �  CREATE TABLE public.attendance (
    id integer NOT NULL,
    batch_name character varying(255) NOT NULL,
    student_id character varying NOT NULL,
    student_name character varying(255) NOT NULL,
    date date NOT NULL,
    status boolean NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lecture_no integer DEFAULT 1,
    marked_by_userid text,
    marked_by_role text
);
    DROP TABLE public.attendance;
       public         heap    postgres    false            �            1259    25313    attendance_id_seq    SEQUENCE     �   CREATE SEQUENCE public.attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.attendance_id_seq;
       public          postgres    false    252            7           0    0    attendance_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.attendance_id_seq OWNED BY public.attendance.id;
          public          postgres    false    251            �            1259    24739    certificates    TABLE     �   CREATE TABLE public.certificates (
    id integer NOT NULL,
    profile_id character varying,
    certificate_name character varying(255),
    issuing_organization character varying(255),
    certificate_date date
);
     DROP TABLE public.certificates;
       public         heap    postgres    false            �            1259    24744    certificates_id_seq    SEQUENCE     �   CREATE SEQUENCE public.certificates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.certificates_id_seq;
       public          postgres    false    219            8           0    0    certificates_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.certificates_id_seq OWNED BY public.certificates.id;
          public          postgres    false    220            �            1259    24745 
   educations    TABLE     �   CREATE TABLE public.educations (
    id integer NOT NULL,
    profile_id integer,
    institution character varying(255),
    degree character varying(255),
    start_date date,
    end_date date,
    field_of_study character varying(255)
);
    DROP TABLE public.educations;
       public         heap    postgres    false            �            1259    24750    educations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.educations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.educations_id_seq;
       public          postgres    false    221            9           0    0    educations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.educations_id_seq OWNED BY public.educations.id;
          public          postgres    false    222                       1259    25565    evaluations    TABLE     6  CREATE TABLE public.evaluations (
    id integer NOT NULL,
    student_id character varying(255) NOT NULL,
    batch_name character varying(255) NOT NULL,
    attempt character varying(50) NOT NULL,
    technical numeric(5,2),
    mcq numeric(5,2),
    oral numeric(5,2),
    total numeric(5,2),
    remark text,
    pending_technical boolean DEFAULT false,
    pending_mcq boolean DEFAULT false,
    pending_oral boolean DEFAULT false,
    pending_remark boolean DEFAULT false,
    student_name character varying(255) NOT NULL,
    email_id character varying(255) NOT NULL,
    attempt_name text,
    created_by_userid text,
    created_by_role text,
    updated_by_userid text,
    updated_by_role text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone
);
    DROP TABLE public.evaluations;
       public         heap    postgres    false            
           1259    25564    evaluations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.evaluations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.evaluations_id_seq;
       public          postgres    false    267            :           0    0    evaluations_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.evaluations_id_seq OWNED BY public.evaluations.id;
          public          postgres    false    266            �            1259    25324    exams    TABLE     �   CREATE TABLE public.exams (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    duration integer NOT NULL,
    instructions text,
    shuffle_questions boolean DEFAULT false
);
    DROP TABLE public.exams;
       public         heap    postgres    false            �            1259    25323    exams_id_seq    SEQUENCE     �   CREATE SEQUENCE public.exams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.exams_id_seq;
       public          postgres    false    254            ;           0    0    exams_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.exams_id_seq OWNED BY public.exams.id;
          public          postgres    false    253            �            1259    24757    experiences    TABLE     a  CREATE TABLE public.experiences (
    id integer NOT NULL,
    profile_id integer,
    company character varying(255),
    role character varying(255),
    start_date date,
    end_date text,
    city character varying(255),
    state character varying(255),
    total_experience text,
    work_desc text,
    currently_working boolean DEFAULT false
);
    DROP TABLE public.experiences;
       public         heap    postgres    false            �            1259    24762    experiences_id_seq    SEQUENCE     �   CREATE SEQUENCE public.experiences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.experiences_id_seq;
       public          postgres    false    223            <           0    0    experiences_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.experiences_id_seq OWNED BY public.experiences.id;
          public          postgres    false    224                       1259    25738    extra_projects    TABLE     �   CREATE TABLE public.extra_projects (
    id integer NOT NULL,
    profile_id integer,
    title text NOT NULL,
    description text,
    technology text
);
 "   DROP TABLE public.extra_projects;
       public         heap    postgres    false                       1259    25737    extra_projects_id_seq    SEQUENCE     �   CREATE SEQUENCE public.extra_projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.extra_projects_id_seq;
       public          postgres    false    270            =           0    0    extra_projects_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.extra_projects_id_seq OWNED BY public.extra_projects.id;
          public          postgres    false    269            �            1259    24763    grades    TABLE     �  CREATE TABLE public.grades (
    id integer NOT NULL,
    batch_name text,
    numofweeks integer,
    batch_start_date date,
    instructor_name text,
    batch_type text,
    track_name character varying,
    created_by text,
    created_role text,
    updated_by text,
    updated_role text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.grades;
       public         heap    postgres    false            �            1259    24768    grades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.grades_id_seq;
       public          postgres    false    225            >           0    0    grades_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;
          public          postgres    false    226            �            1259    24931    instructors    TABLE     �  CREATE TABLE public.instructors (
    id character varying NOT NULL,
    instructor_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    contact character varying(15) NOT NULL,
    technology text NOT NULL,
    password text,
    role text DEFAULT 'trainer'::text,
    email_password text,
    created_by_userid character varying(255),
    created_by_role character varying(255),
    updated_by_userid character varying(255),
    updated_by_role character varying(255)
);
    DROP TABLE public.instructors;
       public         heap    postgres    false            �            1259    24930    instructors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.instructors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.instructors_id_seq;
       public          postgres    false    248            ?           0    0    instructors_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.instructors_id_seq OWNED BY public.instructors.id;
          public          postgres    false    247                       1259    25362    intern_login    TABLE     �  CREATE TABLE public.intern_login (
    student_id character varying NOT NULL,
    name character varying(255) NOT NULL,
    email_id character varying(255) NOT NULL,
    contact_no character varying(20) NOT NULL,
    role character varying(50) DEFAULT 'intern'::character varying,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(50) DEFAULT 'In Training'::character varying
);
     DROP TABLE public.intern_login;
       public         heap    postgres    false            �            1259    24769 
   onboarding    TABLE     =  CREATE TABLE public.onboarding (
    id integer NOT NULL,
    salutation character varying(10),
    first_name character varying(100),
    middle_name character varying(100),
    last_name character varying(100),
    full_name character varying(200),
    fathers_name character varying(100),
    mothers_name character varying(100),
    gender character varying(10),
    blood_group character varying(5),
    dob date,
    marital_status character varying(10),
    candidate_photo text,
    country_code character varying(10),
    mobile_number character varying(20),
    alternate_mobile_number character varying(20),
    email character varying(100),
    bank_name character varying(100),
    account_number character varying(50),
    ifsc_code character varying(20),
    passbook_upload text,
    non_icici_bank_name character varying(100),
    non_icici_account_number character varying(50),
    non_icici_ifsc_code character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.onboarding;
       public         heap    postgres    false            �            1259    24776    onboarding_education    TABLE     �  CREATE TABLE public.onboarding_education (
    id integer NOT NULL,
    candidate_id integer,
    degree character varying(100),
    specialization character varying(100),
    cgpa character varying(10),
    is_currently_student boolean,
    start_date date,
    completion_date date,
    institute character varying(100),
    other_institute character varying(100),
    university character varying(100),
    other_university character varying(100),
    document_proof text,
    institute_address text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 (   DROP TABLE public.onboarding_education;
       public         heap    postgres    false            �            1259    24783    onboarding_education_id_seq    SEQUENCE     �   CREATE SEQUENCE public.onboarding_education_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.onboarding_education_id_seq;
       public          postgres    false    228            @           0    0    onboarding_education_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.onboarding_education_id_seq OWNED BY public.onboarding_education.id;
          public          postgres    false    229            �            1259    24784    onboarding_id_seq    SEQUENCE     �   CREATE SEQUENCE public.onboarding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.onboarding_id_seq;
       public          postgres    false    227            A           0    0    onboarding_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.onboarding_id_seq OWNED BY public.onboarding.id;
          public          postgres    false    230                       1259    25348    options    TABLE     �   CREATE TABLE public.options (
    id integer NOT NULL,
    question_id integer,
    text text NOT NULL,
    image_url text,
    is_correct boolean DEFAULT false
);
    DROP TABLE public.options;
       public         heap    postgres    false                       1259    25347    options_id_seq    SEQUENCE     �   CREATE SEQUENCE public.options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.options_id_seq;
       public          postgres    false    258            B           0    0    options_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;
          public          postgres    false    257            �            1259    24785    partner_student_request    TABLE     |  CREATE TABLE public.partner_student_request (
    id integer NOT NULL,
    student_name text,
    email_id text,
    contact_no text,
    skillset text,
    passout_year text,
    highest_qualification text,
    current_location text,
    client_name text,
    request_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    company_name text,
    company_website text
);
 +   DROP TABLE public.partner_student_request;
       public         heap    postgres    false            �            1259    24791    partner_student_request_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_student_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.partner_student_request_id_seq;
       public          postgres    false    231            C           0    0    partner_student_request_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.partner_student_request_id_seq OWNED BY public.partner_student_request.id;
          public          postgres    false    232            �            1259    24792    professional_summaries    TABLE     r   CREATE TABLE public.professional_summaries (
    id integer NOT NULL,
    profile_id integer,
    summary text
);
 *   DROP TABLE public.professional_summaries;
       public         heap    postgres    false            �            1259    24797    professional_summaries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.professional_summaries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.professional_summaries_id_seq;
       public          postgres    false    233            D           0    0    professional_summaries_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.professional_summaries_id_seq OWNED BY public.professional_summaries.id;
          public          postgres    false    234            �            1259    24798    profiles    TABLE       CREATE TABLE public.profiles (
    id integer NOT NULL,
    userid character varying,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    phone character varying(50),
    address text,
    linkedinid character varying(255),
    profile_pic_path character varying(255),
    review_resumepath character varying(255),
    finale_resumepath character varying(255),
    approval_status character varying(255),
    github character varying,
    website character varying
);
    DROP TABLE public.profiles;
       public         heap    postgres    false            �            1259    24803    profiles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.profiles_id_seq;
       public          postgres    false    235            E           0    0    profiles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;
          public          postgres    false    236            �            1259    24804    projects    TABLE     �   CREATE TABLE public.projects (
    id integer NOT NULL,
    experience_id integer,
    title character varying(255),
    description text,
    technology character varying(255)
);
    DROP TABLE public.projects;
       public         heap    postgres    false            �            1259    24809    projects_id_seq    SEQUENCE     �   CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.projects_id_seq;
       public          postgres    false    237            F           0    0    projects_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;
          public          postgres    false    238                        1259    25334 	   questions    TABLE     �   CREATE TABLE public.questions (
    id integer NOT NULL,
    exam_id integer,
    text text NOT NULL,
    image_url text,
    marks integer NOT NULL
);
    DROP TABLE public.questions;
       public         heap    postgres    false            �            1259    25333    questions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.questions_id_seq;
       public          postgres    false    256            G           0    0    questions_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;
          public          postgres    false    255            �            1259    24810    register    TABLE     `  CREATE TABLE public.register (
    userid character varying NOT NULL,
    name text,
    email_id text,
    contact_no text,
    username text,
    password text,
    role text,
    company_name text,
    company_website text,
    reset_token text,
    reset_token_expires bigint,
    email_password text,
    created_at timestamp without time zone
);
    DROP TABLE public.register;
       public         heap    postgres    false            �            1259    24815    register_id_seq    SEQUENCE     �   CREATE SEQUENCE public.register_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.register_id_seq;
       public          postgres    false    239            H           0    0    register_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.register_id_seq OWNED BY public.register.userid;
          public          postgres    false    240            �            1259    24816    skills    TABLE     r   CREATE TABLE public.skills (
    id integer NOT NULL,
    profile_id integer,
    skill character varying(255)
);
    DROP TABLE public.skills;
       public         heap    postgres    false            �            1259    24819    skills_id_seq    SEQUENCE     �   CREATE SEQUENCE public.skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.skills_id_seq;
       public          postgres    false    241            I           0    0    skills_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.id;
          public          postgres    false    242                       1259    25415    status_change_history    TABLE     R  CREATE TABLE public.status_change_history (
    id integer NOT NULL,
    student_id character varying,
    old_status character varying(100),
    new_status character varying(100),
    reason text,
    changed_at timestamp without time zone DEFAULT now(),
    created_by_userid character varying,
    created_by_role character varying
);
 )   DROP TABLE public.status_change_history;
       public         heap    postgres    false                       1259    25414    status_change_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.status_change_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.status_change_history_id_seq;
       public          postgres    false    263            J           0    0    status_change_history_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.status_change_history_id_seq OWNED BY public.status_change_history.id;
          public          postgres    false    262            �            1259    25192    student_batch_history    TABLE     w  CREATE TABLE public.student_batch_history (
    id integer NOT NULL,
    student_id character varying,
    new_batch character varying(255) NOT NULL,
    moved_at timestamp without time zone DEFAULT now(),
    move_reason character varying(255),
    old_batch character varying(255),
    created_by_role character varying(50),
    created_by_userid character varying(100)
);
 )   DROP TABLE public.student_batch_history;
       public         heap    postgres    false            �            1259    25191    student_batch_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_batch_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.student_batch_history_id_seq;
       public          postgres    false    250            K           0    0    student_batch_history_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.student_batch_history_id_seq OWNED BY public.student_batch_history.id;
          public          postgres    false    249                       1259    25384    student_notifications    TABLE     �   CREATE TABLE public.student_notifications (
    id integer NOT NULL,
    student_id character varying NOT NULL,
    message text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    seen boolean DEFAULT false
);
 )   DROP TABLE public.student_notifications;
       public         heap    postgres    false                       1259    25383    student_notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.student_notifications_id_seq;
       public          postgres    false    261            L           0    0    student_notifications_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.student_notifications_id_seq OWNED BY public.student_notifications.id;
          public          postgres    false    260            �            1259    24820    student_registration    TABLE     w  CREATE TABLE public.student_registration (
    id character varying NOT NULL,
    student_name text,
    email_id text,
    contact_no text,
    passout_year text,
    batch_name text,
    highest_qualification text,
    skillset text,
    certification text,
    current_location text,
    experience text,
    resume text,
    placement_status text,
    request text,
    training_status character varying(50) DEFAULT 'In Training'::character varying NOT NULL,
    password text,
    created_by_role character varying(50),
    created_by_userid character varying(100),
    created_at timestamp without time zone DEFAULT now()
);
 (   DROP TABLE public.student_registration;
       public         heap    postgres    false            �            1259    24825    student_registration_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.student_registration_id_seq;
       public          postgres    false    243            M           0    0    student_registration_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.student_registration_id_seq OWNED BY public.student_registration.id;
          public          postgres    false    244            �            1259    24922    tracks    TABLE     L  CREATE TABLE public.tracks (
    id integer NOT NULL,
    track_name character varying(255) NOT NULL,
    start_date date,
    recognition_code text,
    created_by_userid character varying(255),
    created_by_role character varying(255),
    updated_by_userid character varying(255),
    updated_by_role character varying(255)
);
    DROP TABLE public.tracks;
       public         heap    postgres    false            �            1259    24921    tracks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tracks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tracks_id_seq;
       public          postgres    false    246            N           0    0    tracks_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tracks_id_seq OWNED BY public.tracks.id;
          public          postgres    false    245                       2604    25433    absentee_notifications id    DEFAULT     �   ALTER TABLE ONLY public.absentee_notifications ALTER COLUMN id SET DEFAULT nextval('public.absentee_notifications_id_seq'::regclass);
 H   ALTER TABLE public.absentee_notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    265    265            �           2604    24826    access_card_details id    DEFAULT     �   ALTER TABLE ONLY public.access_card_details ALTER COLUMN id SET DEFAULT nextval('public.access_card_details_id_seq'::regclass);
 E   ALTER TABLE public.access_card_details ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �           2604    24827    achievements id    DEFAULT     r   ALTER TABLE ONLY public.achievements ALTER COLUMN id SET DEFAULT nextval('public.achievements_id_seq'::regclass);
 >   ALTER TABLE public.achievements ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �           2604    25317    attendance id    DEFAULT     n   ALTER TABLE ONLY public.attendance ALTER COLUMN id SET DEFAULT nextval('public.attendance_id_seq'::regclass);
 <   ALTER TABLE public.attendance ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251    252            �           2604    24828    certificates id    DEFAULT     r   ALTER TABLE ONLY public.certificates ALTER COLUMN id SET DEFAULT nextval('public.certificates_id_seq'::regclass);
 >   ALTER TABLE public.certificates ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            �           2604    24829    educations id    DEFAULT     n   ALTER TABLE ONLY public.educations ALTER COLUMN id SET DEFAULT nextval('public.educations_id_seq'::regclass);
 <   ALTER TABLE public.educations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221                       2604    25568    evaluations id    DEFAULT     p   ALTER TABLE ONLY public.evaluations ALTER COLUMN id SET DEFAULT nextval('public.evaluations_id_seq'::regclass);
 =   ALTER TABLE public.evaluations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    266    267    267            �           2604    25327    exams id    DEFAULT     d   ALTER TABLE ONLY public.exams ALTER COLUMN id SET DEFAULT nextval('public.exams_id_seq'::regclass);
 7   ALTER TABLE public.exams ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    254    254            �           2604    24831    experiences id    DEFAULT     p   ALTER TABLE ONLY public.experiences ALTER COLUMN id SET DEFAULT nextval('public.experiences_id_seq'::regclass);
 =   ALTER TABLE public.experiences ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223                       2604    25741    extra_projects id    DEFAULT     v   ALTER TABLE ONLY public.extra_projects ALTER COLUMN id SET DEFAULT nextval('public.extra_projects_id_seq'::regclass);
 @   ALTER TABLE public.extra_projects ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    270    270            �           2604    24832 	   grades id    DEFAULT     f   ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);
 8   ALTER TABLE public.grades ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            �           2604    24833    onboarding id    DEFAULT     n   ALTER TABLE ONLY public.onboarding ALTER COLUMN id SET DEFAULT nextval('public.onboarding_id_seq'::regclass);
 <   ALTER TABLE public.onboarding ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    227            �           2604    24834    onboarding_education id    DEFAULT     �   ALTER TABLE ONLY public.onboarding_education ALTER COLUMN id SET DEFAULT nextval('public.onboarding_education_id_seq'::regclass);
 F   ALTER TABLE public.onboarding_education ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228            �           2604    25351 
   options id    DEFAULT     h   ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);
 9   ALTER TABLE public.options ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    258    258            �           2604    24835    partner_student_request id    DEFAULT     �   ALTER TABLE ONLY public.partner_student_request ALTER COLUMN id SET DEFAULT nextval('public.partner_student_request_id_seq'::regclass);
 I   ALTER TABLE public.partner_student_request ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231            �           2604    24836    professional_summaries id    DEFAULT     �   ALTER TABLE ONLY public.professional_summaries ALTER COLUMN id SET DEFAULT nextval('public.professional_summaries_id_seq'::regclass);
 H   ALTER TABLE public.professional_summaries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233            �           2604    24837    profiles id    DEFAULT     j   ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);
 :   ALTER TABLE public.profiles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235            �           2604    24838    projects id    DEFAULT     j   ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);
 :   ALTER TABLE public.projects ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237            �           2604    25337    questions id    DEFAULT     l   ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);
 ;   ALTER TABLE public.questions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    256    256            �           2604    25761    register userid    DEFAULT     n   ALTER TABLE ONLY public.register ALTER COLUMN userid SET DEFAULT nextval('public.register_id_seq'::regclass);
 >   ALTER TABLE public.register ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    240    239            �           2604    24840 	   skills id    DEFAULT     f   ALTER TABLE ONLY public.skills ALTER COLUMN id SET DEFAULT nextval('public.skills_id_seq'::regclass);
 8   ALTER TABLE public.skills ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241                       2604    25418    status_change_history id    DEFAULT     �   ALTER TABLE ONLY public.status_change_history ALTER COLUMN id SET DEFAULT nextval('public.status_change_history_id_seq'::regclass);
 G   ALTER TABLE public.status_change_history ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    263    263            �           2604    25195    student_batch_history id    DEFAULT     �   ALTER TABLE ONLY public.student_batch_history ALTER COLUMN id SET DEFAULT nextval('public.student_batch_history_id_seq'::regclass);
 G   ALTER TABLE public.student_batch_history ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250                       2604    25387    student_notifications id    DEFAULT     �   ALTER TABLE ONLY public.student_notifications ALTER COLUMN id SET DEFAULT nextval('public.student_notifications_id_seq'::regclass);
 G   ALTER TABLE public.student_notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260    261            �           2604    24925 	   tracks id    DEFAULT     f   ALTER TABLE ONLY public.tracks ALTER COLUMN id SET DEFAULT nextval('public.tracks_id_seq'::regclass);
 8   ALTER TABLE public.tracks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    246    246            (          0    25430    absentee_notifications 
   TABLE DATA           l   COPY public.absentee_notifications (id, student_id, student_name, batch_name, created_at, seen) FROM stdin;
    public          postgres    false    265   v      �          0    24725    access_card_details 
   TABLE DATA           �   COPY public.access_card_details (id, trainee_code, trainee_name, email, contact, id_card_type, access_card_number, card_allocation_date, training_duration, trainer_name, manager_name, card_submitted_date, created_at, updated_at, deposit) FROM stdin;
    public          postgres    false    215   �      �          0    24733    achievements 
   TABLE DATA           d   COPY public.achievements (id, profile_id, award_name, issuing_organization, award_date) FROM stdin;
    public          postgres    false    217   N      +          0    25723    aptitude_result 
   TABLE DATA           �   COPY public.aptitude_result (id, aptitude_marks, percentage, result, created_by_role, created_by_userid, created_at) FROM stdin;
    public          postgres    false    268   k                0    25314 
   attendance 
   TABLE DATA           �   COPY public.attendance (id, batch_name, student_id, student_name, date, status, created_at, lecture_no, marked_by_userid, marked_by_role) FROM stdin;
    public          postgres    false    252   Y      �          0    24739    certificates 
   TABLE DATA           p   COPY public.certificates (id, profile_id, certificate_name, issuing_organization, certificate_date) FROM stdin;
    public          postgres    false    219   1      �          0    24745 
   educations 
   TABLE DATA           o   COPY public.educations (id, profile_id, institution, degree, start_date, end_date, field_of_study) FROM stdin;
    public          postgres    false    221   N      *          0    25565    evaluations 
   TABLE DATA           3  COPY public.evaluations (id, student_id, batch_name, attempt, technical, mcq, oral, total, remark, pending_technical, pending_mcq, pending_oral, pending_remark, student_name, email_id, attempt_name, created_by_userid, created_by_role, updated_by_userid, updated_by_role, created_at, updated_at) FROM stdin;
    public          postgres    false    267   k                0    25324    exams 
   TABLE DATA           U   COPY public.exams (id, title, duration, instructions, shuffle_questions) FROM stdin;
    public          postgres    false    254   -      �          0    24757    experiences 
   TABLE DATA           �   COPY public.experiences (id, profile_id, company, role, start_date, end_date, city, state, total_experience, work_desc, currently_working) FROM stdin;
    public          postgres    false    223   J      -          0    25738    extra_projects 
   TABLE DATA           X   COPY public.extra_projects (id, profile_id, title, description, technology) FROM stdin;
    public          postgres    false    270   g                 0    24763    grades 
   TABLE DATA           �   COPY public.grades (id, batch_name, numofweeks, batch_start_date, instructor_name, batch_type, track_name, created_by, created_role, updated_by, updated_role, created_at, updated_at) FROM stdin;
    public          postgres    false    225   �                0    24931    instructors 
   TABLE DATA           �   COPY public.instructors (id, instructor_name, email, contact, technology, password, role, email_password, created_by_userid, created_by_role, updated_by_userid, updated_by_role) FROM stdin;
    public          postgres    false    248   /      "          0    25362    intern_login 
   TABLE DATA           r   COPY public.intern_login (student_id, name, email_id, contact_no, role, password, created_at, status) FROM stdin;
    public          postgres    false    259   �                0    24769 
   onboarding 
   TABLE DATA           �  COPY public.onboarding (id, salutation, first_name, middle_name, last_name, full_name, fathers_name, mothers_name, gender, blood_group, dob, marital_status, candidate_photo, country_code, mobile_number, alternate_mobile_number, email, bank_name, account_number, ifsc_code, passbook_upload, non_icici_bank_name, non_icici_account_number, non_icici_ifsc_code, created_at, updated_at) FROM stdin;
    public          postgres    false    227   �!                0    24776    onboarding_education 
   TABLE DATA             COPY public.onboarding_education (id, candidate_id, degree, specialization, cgpa, is_currently_student, start_date, completion_date, institute, other_institute, university, other_university, document_proof, institute_address, created_at, updated_at) FROM stdin;
    public          postgres    false    228   �#      !          0    25348    options 
   TABLE DATA           O   COPY public.options (id, question_id, text, image_url, is_correct) FROM stdin;
    public          postgres    false    258   @%                0    24785    partner_student_request 
   TABLE DATA           �   COPY public.partner_student_request (id, student_name, email_id, contact_no, skillset, passout_year, highest_qualification, current_location, client_name, request_date, company_name, company_website) FROM stdin;
    public          postgres    false    231   ]%                0    24792    professional_summaries 
   TABLE DATA           I   COPY public.professional_summaries (id, profile_id, summary) FROM stdin;
    public          postgres    false    233   �&      
          0    24798    profiles 
   TABLE DATA           �   COPY public.profiles (id, userid, first_name, last_name, email, phone, address, linkedinid, profile_pic_path, review_resumepath, finale_resumepath, approval_status, github, website) FROM stdin;
    public          postgres    false    235   �&                0    24804    projects 
   TABLE DATA           U   COPY public.projects (id, experience_id, title, description, technology) FROM stdin;
    public          postgres    false    237   �&                0    25334 	   questions 
   TABLE DATA           H   COPY public.questions (id, exam_id, text, image_url, marks) FROM stdin;
    public          postgres    false    256   '                0    24810    register 
   TABLE DATA           �   COPY public.register (userid, name, email_id, contact_no, username, password, role, company_name, company_website, reset_token, reset_token_expires, email_password, created_at) FROM stdin;
    public          postgres    false    239   "'                0    24816    skills 
   TABLE DATA           7   COPY public.skills (id, profile_id, skill) FROM stdin;
    public          postgres    false    241   �(      &          0    25415    status_change_history 
   TABLE DATA           �   COPY public.status_change_history (id, student_id, old_status, new_status, reason, changed_at, created_by_userid, created_by_role) FROM stdin;
    public          postgres    false    263   �(                0    25192    student_batch_history 
   TABLE DATA           �   COPY public.student_batch_history (id, student_id, new_batch, moved_at, move_reason, old_batch, created_by_role, created_by_userid) FROM stdin;
    public          postgres    false    250   �(      $          0    25384    student_notifications 
   TABLE DATA           Z   COPY public.student_notifications (id, student_id, message, created_at, seen) FROM stdin;
    public          postgres    false    261   �)                0    24820    student_registration 
   TABLE DATA           ,  COPY public.student_registration (id, student_name, email_id, contact_no, passout_year, batch_name, highest_qualification, skillset, certification, current_location, experience, resume, placement_status, request, training_status, password, created_by_role, created_by_userid, created_at) FROM stdin;
    public          postgres    false    243   *                0    24922    tracks 
   TABLE DATA           �   COPY public.tracks (id, track_name, start_date, recognition_code, created_by_userid, created_by_role, updated_by_userid, updated_by_role) FROM stdin;
    public          postgres    false    246   �,      O           0    0    absentee_notifications_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.absentee_notifications_id_seq', 26, true);
          public          postgres    false    264            P           0    0    access_card_details_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.access_card_details_id_seq', 6, true);
          public          postgres    false    216            Q           0    0    achievements_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.achievements_id_seq', 100, true);
          public          postgres    false    218            R           0    0    attendance_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.attendance_id_seq', 321, true);
          public          postgres    false    251            S           0    0    certificates_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.certificates_id_seq', 130, true);
          public          postgres    false    220            T           0    0    educations_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.educations_id_seq', 145, true);
          public          postgres    false    222            U           0    0    evaluations_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.evaluations_id_seq', 92, true);
          public          postgres    false    266            V           0    0    exams_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.exams_id_seq', 4, true);
          public          postgres    false    253            W           0    0    experiences_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.experiences_id_seq', 168, true);
          public          postgres    false    224            X           0    0    extra_projects_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.extra_projects_id_seq', 12, true);
          public          postgres    false    269            Y           0    0    grades_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.grades_id_seq', 82, true);
          public          postgres    false    226            Z           0    0    instructors_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.instructors_id_seq', 34, true);
          public          postgres    false    247            [           0    0    onboarding_education_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.onboarding_education_id_seq', 11, true);
          public          postgres    false    229            \           0    0    onboarding_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.onboarding_id_seq', 26, true);
          public          postgres    false    230            ]           0    0    options_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.options_id_seq', 8, true);
          public          postgres    false    257            ^           0    0    partner_student_request_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.partner_student_request_id_seq', 33, true);
          public          postgres    false    232            _           0    0    professional_summaries_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.professional_summaries_id_seq', 109, true);
          public          postgres    false    234            `           0    0    profiles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.profiles_id_seq', 64, true);
          public          postgres    false    236            a           0    0    projects_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.projects_id_seq', 205, true);
          public          postgres    false    238            b           0    0    questions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.questions_id_seq', 2, true);
          public          postgres    false    255            c           0    0    register_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.register_id_seq', 93, true);
          public          postgres    false    240            d           0    0    skills_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.skills_id_seq', 465, true);
          public          postgres    false    242            e           0    0    status_change_history_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.status_change_history_id_seq', 69, true);
          public          postgres    false    262            f           0    0    student_batch_history_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.student_batch_history_id_seq', 214, true);
          public          postgres    false    249            g           0    0    student_notifications_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.student_notifications_id_seq', 90, true);
          public          postgres    false    260            h           0    0    student_registration_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.student_registration_id_seq', 1301, true);
          public          postgres    false    244            i           0    0    tracks_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.tracks_id_seq', 16, true);
          public          postgres    false    245            T           2606    25436 2   absentee_notifications absentee_notifications_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.absentee_notifications
    ADD CONSTRAINT absentee_notifications_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.absentee_notifications DROP CONSTRAINT absentee_notifications_pkey;
       public            postgres    false    265                       2606    24843 ,   access_card_details access_card_details_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.access_card_details
    ADD CONSTRAINT access_card_details_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.access_card_details DROP CONSTRAINT access_card_details_pkey;
       public            postgres    false    215                       2606    24845    achievements achievements_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.achievements DROP CONSTRAINT achievements_pkey;
       public            postgres    false    217            Z           2606    25733 $   aptitude_result aptitude_result_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.aptitude_result
    ADD CONSTRAINT aptitude_result_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.aptitude_result DROP CONSTRAINT aptitude_result_pkey;
       public            postgres    false    268            B           2606    25322    attendance attendance_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.attendance DROP CONSTRAINT attendance_pkey;
       public            postgres    false    252                       2606    24847    certificates certificates_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.certificates DROP CONSTRAINT certificates_pkey;
       public            postgres    false    219                       2606    24849    educations educations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.educations
    ADD CONSTRAINT educations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.educations DROP CONSTRAINT educations_pkey;
       public            postgres    false    221            4           2606    24851    student_registration email 
   CONSTRAINT     Y   ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT email UNIQUE (email_id);
 D   ALTER TABLE ONLY public.student_registration DROP CONSTRAINT email;
       public            postgres    false    243            .           2606    24853    register email_id 
   CONSTRAINT     P   ALTER TABLE ONLY public.register
    ADD CONSTRAINT email_id UNIQUE (email_id);
 ;   ALTER TABLE ONLY public.register DROP CONSTRAINT email_id;
       public            postgres    false    239            V           2606    25576    evaluations evaluations_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT evaluations_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.evaluations DROP CONSTRAINT evaluations_pkey;
       public            postgres    false    267            F           2606    25332    exams exams_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.exams DROP CONSTRAINT exams_pkey;
       public            postgres    false    254                       2606    24857    experiences experiences_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.experiences DROP CONSTRAINT experiences_pkey;
       public            postgres    false    223            \           2606    25745 "   extra_projects extra_projects_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.extra_projects
    ADD CONSTRAINT extra_projects_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.extra_projects DROP CONSTRAINT extra_projects_pkey;
       public            postgres    false    270                       2606    24859    grades grades_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.grades DROP CONSTRAINT grades_pkey;
       public            postgres    false    225            <           2606    24940 !   instructors instructors_email_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_email_key UNIQUE (email);
 K   ALTER TABLE ONLY public.instructors DROP CONSTRAINT instructors_email_key;
       public            postgres    false    248            >           2606    25774    instructors instructors_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.instructors DROP CONSTRAINT instructors_pkey;
       public            postgres    false    248            L           2606    25372 &   intern_login intern_login_email_id_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.intern_login
    ADD CONSTRAINT intern_login_email_id_key UNIQUE (email_id);
 P   ALTER TABLE ONLY public.intern_login DROP CONSTRAINT intern_login_email_id_key;
       public            postgres    false    259            N           2606    25772    intern_login intern_login_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.intern_login
    ADD CONSTRAINT intern_login_pkey PRIMARY KEY (student_id);
 H   ALTER TABLE ONLY public.intern_login DROP CONSTRAINT intern_login_pkey;
       public            postgres    false    259            "           2606    24861 .   onboarding_education onboarding_education_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.onboarding_education
    ADD CONSTRAINT onboarding_education_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.onboarding_education DROP CONSTRAINT onboarding_education_pkey;
       public            postgres    false    228                        2606    24863    onboarding onboarding_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.onboarding
    ADD CONSTRAINT onboarding_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.onboarding DROP CONSTRAINT onboarding_pkey;
       public            postgres    false    227            J           2606    25356    options options_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.options DROP CONSTRAINT options_pkey;
       public            postgres    false    258            $           2606    24865 4   partner_student_request partner_student_request_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.partner_student_request
    ADD CONSTRAINT partner_student_request_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.partner_student_request DROP CONSTRAINT partner_student_request_pkey;
       public            postgres    false    231            &           2606    24867 2   professional_summaries professional_summaries_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.professional_summaries
    ADD CONSTRAINT professional_summaries_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.professional_summaries DROP CONSTRAINT professional_summaries_pkey;
       public            postgres    false    233            (           2606    24869    profiles profiles_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_email_key;
       public            postgres    false    235            *           2606    24871    profiles profiles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_pkey;
       public            postgres    false    235            ,           2606    24873    projects projects_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            postgres    false    237            H           2606    25341    questions questions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
       public            postgres    false    256            0           2606    25763    register register_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.register
    ADD CONSTRAINT register_pkey PRIMARY KEY (userid);
 @   ALTER TABLE ONLY public.register DROP CONSTRAINT register_pkey;
       public            postgres    false    239            2           2606    24877    skills skills_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.skills DROP CONSTRAINT skills_pkey;
       public            postgres    false    241            R           2606    25423 0   status_change_history status_change_history_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.status_change_history
    ADD CONSTRAINT status_change_history_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.status_change_history DROP CONSTRAINT status_change_history_pkey;
       public            postgres    false    263            @           2606    25198 0   student_batch_history student_batch_history_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.student_batch_history
    ADD CONSTRAINT student_batch_history_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.student_batch_history DROP CONSTRAINT student_batch_history_pkey;
       public            postgres    false    250            P           2606    25393 0   student_notifications student_notifications_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.student_notifications
    ADD CONSTRAINT student_notifications_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.student_notifications DROP CONSTRAINT student_notifications_pkey;
       public            postgres    false    261            6           2606    25513 .   student_registration student_registration_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.student_registration
    ADD CONSTRAINT student_registration_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.student_registration DROP CONSTRAINT student_registration_pkey;
       public            postgres    false    243            8           2606    24927    tracks tracks_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tracks DROP CONSTRAINT tracks_pkey;
       public            postgres    false    246            :           2606    24929    tracks tracks_track_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_track_name_key UNIQUE (track_name);
 F   ALTER TABLE ONLY public.tracks DROP CONSTRAINT tracks_track_name_key;
       public            postgres    false    246            D           2606    25524 "   attendance unique_attendance_entry 
   CONSTRAINT     �   ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT unique_attendance_entry UNIQUE (student_id, batch_name, lecture_no, date);
 L   ALTER TABLE ONLY public.attendance DROP CONSTRAINT unique_attendance_entry;
       public            postgres    false    252    252    252    252            X           2606    25587 (   evaluations unique_student_batch_attempt 
   CONSTRAINT     ~   ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT unique_student_batch_attempt UNIQUE (student_id, batch_name, attempt);
 R   ALTER TABLE ONLY public.evaluations DROP CONSTRAINT unique_student_batch_attempt;
       public            postgres    false    267    267    267            ]           2606    24890 %   educations educations_profile_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.educations
    ADD CONSTRAINT educations_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.profiles(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.educations DROP CONSTRAINT educations_profile_id_fkey;
       public          postgres    false    4906    221    235            e           2606    25577 '   evaluations evaluations_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT evaluations_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_registration(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.evaluations DROP CONSTRAINT evaluations_student_id_fkey;
       public          postgres    false    267    243    4918            ^           2606    24895 '   experiences experiences_profile_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.profiles(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.experiences DROP CONSTRAINT experiences_profile_id_fkey;
       public          postgres    false    4906    223    235            f           2606    25746 -   extra_projects extra_projects_profile_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.extra_projects
    ADD CONSTRAINT extra_projects_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.profiles(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.extra_projects DROP CONSTRAINT extra_projects_profile_id_fkey;
       public          postgres    false    4906    270    235            _           2606    24900 ;   onboarding_education onboarding_education_candidate_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.onboarding_education
    ADD CONSTRAINT onboarding_education_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES public.onboarding(id) ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.onboarding_education DROP CONSTRAINT onboarding_education_candidate_id_fkey;
       public          postgres    false    228    4896    227            d           2606    25357     options options_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.options DROP CONSTRAINT options_question_id_fkey;
       public          postgres    false    4936    258    256            `           2606    24905 =   professional_summaries professional_summaries_profile_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.professional_summaries
    ADD CONSTRAINT professional_summaries_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.profiles(id) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.professional_summaries DROP CONSTRAINT professional_summaries_profile_id_fkey;
       public          postgres    false    233    4906    235            a           2606    24910 $   projects projects_experience_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_experience_id_fkey FOREIGN KEY (experience_id) REFERENCES public.experiences(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_experience_id_fkey;
       public          postgres    false    223    237    4892            c           2606    25342     questions questions_exam_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_exam_id_fkey FOREIGN KEY (exam_id) REFERENCES public.exams(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_exam_id_fkey;
       public          postgres    false    4934    254    256            b           2606    24915    skills skills_profile_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.profiles(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.skills DROP CONSTRAINT skills_profile_id_fkey;
       public          postgres    false    4906    241    235            (      x������ � �      �   �  x����j�@���O�/�ewfu��!i!�����K����y���%q"܂fV�|�Y	{!��]8����>T0L5O��K�N��jkp��;i��}^wm�W�u_6�Xg���B�� �Ɩyv�6c1���Oc�vE��(�v�0���tM��\�a�e3�8E[���h�Ê��sQV�[8���&u�G�ep�A��5h�0WP��q3��3%����(ѨD�a�Ǧ?CC��C�����r�_h��42!�)�I[�4J:Q��D�g�*�n�n�u��̼o�Mތg老��1oJ�f��'�s��$afFf�s����Qb0���}x=��L���Fy�b���zM��aK�2y�)�ɦЙ��9CN-�&���s\�m�
ک��T��G�hC�b<�z��_��ꋌ�K�㯗F�䑯V�ߖ:�      �      x������ � �      +   �   x����j1���O���d˖n��9J)��t	�Y���;(�.]"0x�oY�4���B�D�Ra�����X>��7�q8�O�%۽'�s۱N�&�\�5�4��b��^��ד����=k�[�8�l� 7�T��6HE�z�)���B���4&��^^g��Qn����VB�*�¢h9Y�"w���hQn���RhP��C�q��� ۑMҧb�{���.;q�         �   x��ұ
�@��9}
_��%��]�t�`���"��`�����^��mɒo�è�p�����;V�I�(���n�=Ւ���ϲAɍ��)�����Pl�e �z{=�����P@��!Z����&(d���2�s;�Ul$s4����nA�u�_�y��-�J E5΀����\.���|$� @=@��E%I�q�      �      x������ � �      �      x������ � �      *   �   x���A�0���)����iv*��CB�Et�mb;��[sI�`����2�꺬�ŭb��@� E��RM�"
�+��b��8JmQS}^����@�:ri�4J��N���Q.��
�v���R�^�ثA�o޻DLw�=O�<!�Sw�ۈ��x�1�"��8���&A��U+��!�n�\k            x������ � �      �      x������ � �      -      x������ � �          �   x��0��400�44�4202�50�54�K�,��K,��OM�NI�,��,����st����iKL�����!�~3CS+cs+S=C33�2\F��~`������^��X�����������L�cḼ�L�L-�M�]�,����� ֚A�         �   x�����0D��W��T�p������h�@m��[�Do�fvgg�/���/�9%4"$@��j�
�U�T�߆�0��,F�ٴ���w�	넜a)Cf��U	�N_��^��⇁�T*3�W�L�ҋ�^���7K��$��������Zz|��w,�=�U>��	��X�      "   �  x��ֽj�@��Z�
�@�|G�?W�b�4.��*��5A;!Q {����p�S	F���<��Ǉ�wGr�Cs{YNo4��s8}N������˹�)�w����l�q�a��i߇<]o�ަ�2_��qӤ�Be��&m��M�6��ҕ�Nov�f������J_F{��o�=7{kӗ_F���ۦ禷6CY	e4�Ͱmnk3��XF�ތ�f�f�6SYIe4�ʹm&n&k3��\F����f�f66��W��V������ٕ��"#��F�j��t�Py	V�  AȁN*��&�j�$�:�UB��%XY���:L�`��L� �@�	�M`�`�	���<��	��>A|�](TB����(Q��#�
)�R�*E��B�+E�R�J�U)B���������>�Nˉ�j���4?�c�!��啌��|�3�v.(������_v�˴|�����m�*��         �  x����j1�k�S�7^47�f��i��\���[�I�?�1$݁S,�`��1�4�������_�緟/᏿�c�~W����A�p�޿z���.�F䋘/�����)��������0���"U�^UG�$XA ����JRV�!G�l�I>�9T��ݓ�?���)|�2��K�fT�y�=� ��S�	�?���!�!HJ<����!'�忢��@6эa�4k�#ւ�(Y�JҢ\X�-5" �fEdP��ɺ 9Ŋ��"ÙJtcoR2��x�-��
���xv�I���9. M[����cg��42�٠TsT�A�����3o7�5�)E�X���}x�Qy@5���*��;$K;��=�BUGM�i��bo�R��<�6��Ig�k��><Q�T�k7מ���e��ǽy��lF�I�z�$��5s�a��ʓ`��%f:b-�v�)8��Д��>[�yf�ف�y��̳�����d%��\	,�ґ�d��	��b�v�Zn�eY�&��         T  x�͒�N�0������X>���J%�R�e�5nb\)M�x{*�-Ex�_>}:�k\��ǁ��ep���E�ft�)K�[���[��ݳ���~�|�ݿ ����(d��P= �%B���T�ƞ�Ȗ`�3�v�f�V��>�;N����|L���ˋ��.�2����Ո޺m\O6�i�V'�6.%�L`B��b���;�b��H�x�ZG=�-��|�~e!75�.���N2��*뒟܉ĠbJFR螈D-�Q����� ��l.�_46[?��h4gR�Jɞ�$-�Q��O��9Ɔbc%����hd\�8Nz"�����
�d��WYZ�
      !      x������ � �         A  x��ӽn�0��y
? �|g�_ �PUT�N,XIԐHH�����|����_w����B?����:��>��o��Ŏ�^�[�ǎ��gt����r��T]��4�]�?ce�M
�r�8:�1!�5�,n]{�]�6t}*}ǲi붨���n��������A����]��Ó���g_�?�|���m�v�8�얋?���!g�KY3j�Ja��ph��F���'t�r�8əR+;�)�$N�rI!�a:���%�s�N��#�r/I��.I��;��L�?�3�b��r�SL�̜�T�����<�$I�";��            x������ � �      
      x������ � �            x������ � �            x������ � �         }  x���Mo� ���W����M�ɑ�C�n7�"�zbH��5������ݶNҪ+q``x�g��	ZA�����"=$�A��T\S]�k*4�s�&2��I�HƸ@wۥ�\��&�S��h<S�tA9Q��TE�B�.o���gԎ9�Q�Ay2����$��p�6ԦE�7z������lݔM�Ǜ.�����|&7��v�������f�8dQ���Lg��hZ̑���Y���s�H�5T����!�]��{���d��@����%�R2څ��7�pJyVT�ʱR�TR%��d��Y����C����_C/W?�F�7�|�¯��m{
�x�jm&��\P��w����gq_��z}��=xv�|������������            x������ � �      &      x������ � �         �   x���1j�@��Z:� �F�ծ:��p&iL�8�؁H`|{ǅ	y����0Ň��ݦ^o{�"(�O���o��m��@p�]#bՄ�}>\�6�i�_yxp�-����pʃ{��ϭ�pOߩ����^*�<�մ�^��[�7��HuoZOT�u�zkZգi]��L���:ĴN���:��֩�u��N����u*d,�S!�`j�:�Z��ց���u ���:�u��u�I���X�p�ο�_��,�F���      $      x������ � �         �  x��VAn�0<ӯ��K��蓝��k$���0��)#V����6\�I��'�0;�����뙒JKY���_���9n~��n���Vت4��U�-���Y���~���E�~���u�}��q���s���v&����-�������.6�>��e�^�­��u=���Fj�5���g`2УB���2Z�*l��Q�M��'RaQ�� �¢������4:B=Dg�i!p*!�B�+DQGuD�;����O���*��}2t��Q�N������O~��ͦm"���M���ў���C���a��|X�(���	�?����d��H �H�T�$�I �$ J�(�t�=�u S �) Ó��G�dv4�h}�Ȕ�M�4}ţ�v����=
�+��1Y���0�ػ��4�﷮��VP�֔��V�}v�|k}�q��/_�o�Jd���]�����X��"�LV#U��jh����`���K�d��[�t���D�2�� �l��P�A:���B��CN�/��r��W�=G#�l�E�+"�"M�86��l��m?����?��/;���A�`� �@=�t�߄����]��nؐ�b�fk����sg��6��e�v8~I1|2         j   x�34�t�K/�I,Rp�KQ��OIU�
�4202�50�54�t��st���	r&��f�q��PA@eIF~B�)g@$v-���8]R�3�QLp!��=... ��1�     