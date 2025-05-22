import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import Navbar from "../navbar/navbar";
import config from "../config";
import axios from "axios";
import {
  Box, FormHelperText, Grid, Typography, TextField, Button, FormControlLabel, Radio, RadioGroup, CircularProgress, FormControl,
  InputLabel, Select, MenuItem, Dialog, DialogTitle, DialogContent, DialogActions, Tabs, Tab, TableCell, Paper, Table, TableHead,
  TableRow, Checkbox, TableBody, TableContainer, Divider, Container, List, ListItem, ListItemText, Autocomplete
} from "@mui/material";
import "bootstrap/dist/css/bootstrap.min.css";
import "./studentRegistration.css";
import PersonAddAltIcon from '@mui/icons-material/PersonAddAlt';
import SwapHorizIcon from '@mui/icons-material/SwapHoriz';
import Tooltip from '@mui/material/Tooltip';
import { Snackbar, Alert } from "@mui/material";

const NAVBAR_HEIGHT = "64px"; // Adjust this based on your Navbar height

const getCookie = (name) => {
  const match = document.cookie.match(
    "(^|;)\\s*" + name + "\\s*=\\s*([^;]+)"
  );
  return match ? match.pop() : "";
};

const role = getCookie("role");
const userid = getCookie("userid");

const StudentRegistration = () => {
  const [batchNames, setBatchNames] = useState([]);
  const [selectedBatch, setSelectedBatch] = useState("");
  const [file, setFile] = useState(null);
  const [uploading, setUploading] = useState(false);
  const [activeTab, setActiveTab] = useState(0); // 0: Register, 1: Move
  const [otherQualification, setOtherQualification] = useState("");
  const [errorDialogOpen, setErrorDialogOpen] = useState(false);
  const [validationErrors, setValidationErrors] = useState([]);
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const [snackbarMessage, setSnackbarMessage] = useState("");
  const [snackbarSeverity, setSnackbarSeverity] = useState("success"); // success | error | warning | info
  const [ignoredRows, setIgnoredRows] = useState([]);

  const [formData, setFormData] = useState({
    studentName: "",
    email: "",
    contactNo: "",
    passoutYear: "",
    batchName: "",
    highestQualification: "",
    skillset: "",
    certification: "",
    currentLocation: "",
    experience: "",
    trainingStatus: "",
    aptitudeMarks: "",
    aptitudePercentage: "",
    aptitudeResult: ""
  });

  const [registrationType, setRegistrationType] = useState("single");

  // Dialog state
  const [dialogOpen, setDialogOpen] = useState(false);
  const [dialogTitle, setDialogTitle] = useState("");
  const [dialogMessage, setDialogMessage] = useState("");
  //Errors
  const [errors, setErrors] = useState({});
  const [tracks, setTracks] = useState([]);
  const [batches, setBatches] = useState([]);
  const [selectedTrack, setSelectedTrack] = useState("");
  const [moveReason, setMoveReason] = useState("");
  const [moveData, setMoveData] = useState({
    newBatch: "",
    moveReason: "",
  });

  const [noBatchStudents, setNoBatchStudents] = useState([]);
  const [selectedStudentIds, setSelectedStudentIds] = useState([]);
  const [searchQuery, setSearchQuery] = useState("");

  // Options for dropdowns
  const qualificationOptions = [
    "Diploma", "BE", "ME", "BCA", "MCA", "BCS", "MCS", "B.Tech", "M.Tech", "MBA", "BSC", "MSC"
  ];
  const experienceOptions = [
    "Fresher", "Below 6 Months", "6 Months - 1 Year", "1 Year", "2 Years", "3 Years", "4 Years", "5-7 years", "7-10 years", "10+ years"
  ];

  const currentYear = new Date().getFullYear();
  const passoutYearOptions = Array.from({ length: 26 }, (_, i) => currentYear - 20 + i);
  const trainingStatusOptions = ["Placed", "Absconding", "In Training", "Completed", "Shadowed", "pip", "On Leave", "Training Closed"];

  const validateForm = () => {
    const errors = [];
    if (!formData.studentName || formData.studentName.trim().length < 3)
      errors.push("Full Name must be at least 3 characters.");
    if (!formData.email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.email))
      errors.push("Invalid Email format.");
    if (!formData.contactNo || !/^[6-9]\d{9}$/.test(formData.contactNo))
      errors.push("Contact number must be 10 digits starting with 6-9.");

    if (errors.length > 0) {
      setDialogTitle("Validation Error");
      setDialogMessage(errors.join("\n"));
      setDialogOpen(true);
      return false;
    }
    return true;
  };


  const handleFileChange = (event) => {
    const selectedFile = event.target.files[0];
    if (selectedFile) {
      const fileType = selectedFile.type;
      const validTypes = [
        "application/vnd.ms-excel",
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
      ];
      if (validTypes.includes(fileType)) {
        setFile(selectedFile);
      } else {
        setDialogTitle("Invalid File Type");
        setDialogMessage("Please upload an Excel file (.xls or .xlsx).");
        setDialogOpen(true);
        event.target.value = ""; // Clear the input
      }
    }
  };

  const handleTabChange = (event, newValue) => {
    setActiveTab(newValue);
  };

  const handleChange = (e) => {
    const { name, value } = e.target;

    // Update the form data
    setFormData((prev) => ({
      ...prev,
      [name]: value,
    }));

    // Clear error as user types valid input
    setErrors((prevErrors) => ({
      ...prevErrors,
      [name]: "", // Clear only the specific field error
    }));
  };

  const handleRegistrationTypeChange = (event) =>
    setRegistrationType(event.target.value);

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validateForm()) return;

    const finalData = {
      studentName: formData.studentName,
      email: formData.email,
      contactNo: formData.contactNo,
      aptitudeMarks: formData.aptitudeMarks,
      aptitudePercentage: formData.aptitudePercentage,
      aptitudeResult: formData.aptitudeResult,
      passoutYear: formData.passoutYear,
      batchName: formData.batchName,
      highestQualification: formData.highestQualification,
      skillset: formData.skillset,
      certification: formData.certification,
      currentLocation: formData.currentLocation,
      experience: formData.experience,
      trainingStatus: formData.trainingStatus,
      role,
      userid,
    };

    try {
      const response = await fetch(`${config.API_BASE_URL}/api/student-registration-form`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(finalData),
      });

      const result = await response.json();

      if (response.ok) {
        setDialogTitle("Success");
        setDialogMessage("Student successfully registered.");
        setDialogOpen(true);
        setFormData({
          studentName: "",
          email: "",
          contactNo: "",
          aptitudeMarks: "",
          aptitudePercentage: "",
          aptitudeResult: "",
          passoutYear: "",
          batchName: "",
          highestQualification: "",
          skillset: "",
          certification: "",
          currentLocation: "",
          experience: "",
          trainingStatus: "",
        });
        setOtherQualification("");
        setActiveTab(1);
      } else {
        setDialogTitle("Error");
        setDialogMessage(result.errors?.join("\n") || result.message);
        setDialogOpen(true);
      }
    } catch (error) {
      console.error("Registration Error:", error);
      setDialogTitle("Error");
      setDialogMessage("Something went wrong: " + error.message);
      setDialogOpen(true);
    }
  };


  const handleUpload = async () => {
    if (!file) {
      setDialogTitle("Error");
      setDialogMessage("Please select a file.");
      setValidationErrors([]);
      setDialogOpen(true);
      return;
    }

    if (!file.name.endsWith(".xlsx") && !file.name.endsWith(".xls")) {
      setDialogTitle("Error");
      setDialogMessage("Invalid file type. Only .xls and .xlsx files are allowed.");
      setValidationErrors([]);
      setDialogOpen(true);
      return;
    }

    setUploading(true);

    try {
      const formData = new FormData();
      formData.append("file", file);
      formData.append("role", role);
      formData.append("userid", userid);

      const response = await fetch(`${config.API_BASE_URL}/api/studentRegistrationExcelUpload`, {
        method: "POST",
        body: formData,
      });

      const contentType = response.headers.get("content-type");

      if (response.ok) {
        const result = await response.json();

        let message = `${result.inserted} students registered successfully.`;
        setDialogTitle("Success");
        setDialogMessage(message);
        setValidationErrors(result.errorDetails || []);
        setIgnoredRows(result.ignoredDetails || []);
        setDialogOpen(true);

        // Reload after 2 seconds
        setTimeout(() => {
          window.location.reload();
        }, 2000);

      } else if (contentType?.includes("application/json")) {
        const errorJson = await response.json();

        if (errorJson.errors?.length) {
          setDialogTitle("Validation Errors");
          setDialogMessage("Please fix the following issues:");
          setValidationErrors(errorJson.errors);
        } else if (errorJson.ignored?.length) {
          let ignoredMessage = `${errorJson.message}\n\nSome rows were ignored.`;
          setDialogTitle("Some Rows Ignored");
          setDialogMessage(ignoredMessage);
          setValidationErrors([]);
        } else {
          setDialogTitle("Error");
          setDialogMessage(errorJson.message || "Unknown error occurred.");
          setValidationErrors([]);
        }

        setDialogOpen(true);
      } else {
        const errorText = await response.text();
        setDialogTitle("Error");
        setDialogMessage("Student registration error: " + errorText);
        setValidationErrors([]);
        setDialogOpen(true);
      }

    } catch (error) {
      console.error("Upload error:", error);
      setDialogTitle("Error");
      setDialogMessage("Upload failed: " + error.message);
      setValidationErrors([]);
      setDialogOpen(true);
    } finally {
      setUploading(false);
    }
  };

  // Handle dialog close
  const handleCloseDialog = () => setDialogOpen(false);

  //Move student tab
  const fetchNoBatchStudents = async () => {
    try {
      const res = await fetch(`${config.API_BASE_URL}/api/no-batch-students`);
      const data = await res.json();
      setNoBatchStudents(data);
    } catch (err) {
      console.error("Failed to fetch students:", err);
    }
  };

  // Fetch Batches when Track is Selected
  const fetchTracks = async () => {
    try {
      const res = await fetch(`${config.API_BASE_URL}/api/tracks`);
      const data = await res.json();
      setTracks(data);
    } catch (err) {
      console.error("Error fetching tracks:", err);
    }
  };

  const fetchBatchesByTrack = async (trackName) => {
    console.log("Fetching batches for track:", trackName); // Add this
    try {
      const res = await fetch(`${config.API_BASE_URL}/api/getBatchesByTrack?trackName=${encodeURIComponent(trackName)}`);
      const data = await res.json();
      setBatches(data);
    } catch (err) {
      console.error("Error fetching batches:", err);
    }
  };


  useEffect(() => {
    if (activeTab === 1) {
      fetchNoBatchStudents();
      fetchTracks();
    }
  }, [activeTab]);

  const handleTrackChange = (e) => {
    const selected = e.target.value;
    setSelectedTrack(selected);
    setSelectedBatch("");
    fetchBatchesByTrack(selected);
  };

  const toggleSelectAll = (e) => {
    setSelectedStudentIds(e.target.checked ? noBatchStudents.map(s => s.id) : []);
  };

  const toggleSelectOne = (id) => {
    setSelectedStudentIds((prev) =>
      prev.includes(id) ? prev.filter((sid) => sid !== id) : [...prev, id]
    );
  };

  const handleMoveStudentsInBatch = async () => {
    if (!selectedBatch || !moveReason || selectedStudentIds.length === 0) {
      setSnackbarMessage("Please fill all fields and select at least one student.");
      setSnackbarSeverity("warning");
      setSnackbarOpen(true);
      return;
    }

    try {
      const res = await fetch(`${config.API_BASE_URL}/api/move-students-to-batch`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          studentIds: selectedStudentIds,
          newBatch: selectedBatch,
          reason: moveReason,
          role,
          userid,
        }),
      });

      const data = await res.json();
      if (res.ok) {
        setSnackbarMessage("Students moved successfully.");
        setSnackbarSeverity("success");
        setSnackbarOpen(true);

        setMoveReason("");
        setSelectedBatch("");
        setSelectedTrack("");
        setSelectedStudentIds([]);
        fetchNoBatchStudents();
      } else {
        setSnackbarMessage(data.message || "Failed to move students.");
        setSnackbarSeverity("error");
        setSnackbarOpen(true);
      }
    } catch (error) {
      console.error("Error moving students:", error);
      setSnackbarMessage("Server error while moving students.");
      setSnackbarSeverity("error");
      setSnackbarOpen(true);
    }
  };

  const handleDownloadTemplate = () => {
    const templateUrl = `${config.API_BASE_URL}/templates/student-registration-template.xlsx`;

    const link = document.createElement("a");
    link.href = templateUrl;
    link.setAttribute("download", "Student_Registration_Template.xlsx");
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  const filteredStudents = noBatchStudents.filter((student) =>
    `${student.student_name} ${student.email_id} ${student.contact_no}`
      .toLowerCase()
      .includes(searchQuery.toLowerCase())
  );


  return (
    <>
      <Navbar showLogoutButton={true} />
      <Container maxWidth="lg" sx={{ mt: 10 }}>

        <Box sx={{ mt: 10 }}>
          <Tabs
            value={activeTab}
            onChange={handleTabChange}
            centered
            sx={{ minHeight: "40px" }}
          >
            <Tab
              icon={<PersonAddAltIcon />}
              iconPosition="start"
              label="Register Intern"
              value={0}
              sx={{ minWidth: "auto", px: 3, fontWeight: "bold" }}
            />
            <Divider
              orientation="vertical"
              flexItem
              sx={{ height: "30px", mx: 1, borderColor: "primary.main", borderWidth: "2px", alignSelf: "center" }}
            />
            <Tab
              icon={<SwapHorizIcon />}
              iconPosition="start"
              label="Move Intern to Batch"
              value={1}
              sx={{ minWidth: "auto", px: 3, fontWeight: "bold" }}
            />
          </Tabs>
        </Box>

        {activeTab === 0 && (
          <Box sx={{ mt: 1 }}>
            <Paper elevation={3} sx={{ p: 3, borderRadius: 3 }}>

              <Typography variant="h6" sx={{ fontWeight: "bold" }} gutterBottom>
                Intern Registration
              </Typography>
              <RadioGroup
                row
                value={registrationType}
                onChange={handleRegistrationTypeChange}
                sx={{ mb: 3 }}
              >
                <FormControlLabel
                  value="single"
                  control={<Radio />}
                  label="Single Intern Registration"
                />
                <FormControlLabel
                  value="bulk"
                  control={<Radio />}
                  label="Bulk Interns Registration (File Type: Excel)"
                />
              </RadioGroup>

              {registrationType === "single" && (
                <Box
                  sx={{
                    mt: 4,
                    p: 4,
                    borderRadius: 3,
                    boxShadow: 4,
                    backgroundColor: "#f9fafb",
                    maxWidth: "100%",
                  }}
                >
                  {/* <Typography variant="h5" fontWeight="bold" gutterBottom>
                    Single Student Registration
                  </Typography> */}

                  <form onSubmit={handleSubmit}>
                    <Grid container spacing={3}>
                      {/* Required Fields */}
                      <Grid item xs={12}>
                        <Typography variant="h6">Required Fields</Typography>
                      </Grid>

                      <Grid item xs={12} sm={4}>
                        <TextField
                          name="studentName"
                          label="Intern Name*"
                          value={formData.studentName}
                          onChange={handleChange}
                          fullWidth
                          error={!!errors.studentName}
                          helperText={errors.studentName}
                        />
                      </Grid>

                      <Grid item xs={12} sm={4}>
                        <TextField
                          name="email"
                          label="Email Id*"
                          value={formData.email}
                          onChange={handleChange}
                          fullWidth
                          error={!!errors.email}
                          helperText={errors.email}
                        />
                      </Grid>

                      <Grid item xs={12} sm={4}>
                        <TextField
                          name="contactNo"
                          label="Contact Number*"
                          value={formData.contactNo}
                          onChange={(e) => {
                            const value = e.target.value;
                            if (/^\d{0,10}$/.test(value)) {
                              setFormData((prev) => ({ ...prev, contactNo: value }));
                            }
                          }}
                          fullWidth
                          error={!!errors.contactNo}
                          helperText={errors.contactNo}
                        />
                      </Grid>

                      {/* Optional Fields */}
                      <Grid item xs={12}>
                        <Typography variant="h6">Optional Fields</Typography>
                      </Grid>

                      {/* Aptitude Info */}
                      <Grid item xs={12} sm={3}>
                        <TextField
                          name="aptitudeMarks"
                          label="Aptitude Marks"
                          value={formData.aptitudeMarks}
                          onChange={handleChange}
                          fullWidth
                          placeholder="e.g. 45"
                        />
                      </Grid>

                      <Grid item xs={12} sm={3}>
                        <TextField
                          name="aptitudePercentage"
                          label="Aptitude Percentage"
                          value={formData.aptitudePercentage}
                          onChange={handleChange}
                          fullWidth
                          placeholder="e.g. 80%"
                        />
                      </Grid>

                      <Grid item xs={12} sm={3}>
                        <TextField
                          select
                          name="aptitudeResult"
                          label="Aptitude Result"
                          value={formData.aptitudeResult}
                          onChange={handleChange}
                          fullWidth
                        >
                          <MenuItem value="">-- Select Result --</MenuItem>
                          <MenuItem value="Pass">Pass</MenuItem>
                          <MenuItem value="Fail">Fail</MenuItem>
                        </TextField>
                      </Grid>

                      {/* Additional Info */}
                      <Grid item xs={12} sm={3}>
                        <TextField
                          select
                          name="passoutYear"
                          label="Passout Year"
                          value={formData.passoutYear}
                          onChange={handleChange}
                          fullWidth
                        >
                          <MenuItem value="">-- Select Year --</MenuItem>
                          {passoutYearOptions.map((year) => (
                            <MenuItem key={year} value={year}>
                              {year}
                            </MenuItem>
                          ))}
                        </TextField>
                      </Grid>

                      <Grid item xs={12} sm={3}>
                        <TextField
                          name="batchName"
                          label="Batch Name"
                          value={formData.batchName}
                          onChange={handleChange}
                          fullWidth
                        />
                      </Grid>

                      <Grid item xs={12} sm={3}>
                        <Autocomplete
                          freeSolo
                          options={qualificationOptions}
                          value={formData.highestQualification || ""}
                          onChange={(e, newValue) => {
                            setFormData((prev) => ({
                              ...prev,
                              highestQualification: newValue || "",
                            }));
                          }}
                          onInputChange={(e, newInputValue) => {
                            setFormData((prev) => ({
                              ...prev,
                              highestQualification: newInputValue,
                            }));
                          }}
                          renderInput={(params) => (
                            <TextField
                              {...params}
                              label="Highest Qualification"
                              fullWidth
                            />
                          )}
                        />
                      </Grid>

                      <Grid item xs={12} sm={3}>
                        <TextField
                          name="skillset"
                          label="Skillset"
                          value={formData.skillset}
                          onChange={handleChange}
                          fullWidth
                          placeholder="e.g. JavaScript, Python, SQL"
                        />
                      </Grid>

                      <Grid item xs={12} sm={3}>
                        <TextField
                          name="certification"
                          label="Certification"
                          value={formData.certification}
                          onChange={handleChange}
                          fullWidth
                          placeholder="e.g. AWS Certified, Python Bootcamp"
                        />
                      </Grid>

                      <Grid item xs={12} sm={4}>
                        <TextField
                          name="currentLocation"
                          label="Current Location"
                          value={formData.currentLocation}
                          onChange={handleChange}
                          fullWidth
                          placeholder="e.g. Pune, Bangalore"
                        />
                      </Grid>

                      <Grid item xs={12} sm={4}>
                        <TextField
                          select
                          name="experience"
                          label="Experience"
                          value={formData.experience}
                          onChange={handleChange}
                          fullWidth
                        >
                          <MenuItem value="">-- Select Experience --</MenuItem>
                          {experienceOptions.map((exp) => (
                            <MenuItem key={exp} value={exp}>
                              {exp}
                            </MenuItem>
                          ))}
                        </TextField>
                      </Grid>

                      <Grid item xs={12} sm={4}>
                        <TextField
                          select
                          name="trainingStatus"
                          label="Training Status"
                          value={formData.trainingStatus}
                          onChange={handleChange}
                          fullWidth
                        >
                          <MenuItem value="">-- Select Status --</MenuItem>
                          {trainingStatusOptions.map((status) => (
                            <MenuItem key={status} value={status}>
                              {status}
                            </MenuItem>
                          ))}
                        </TextField>
                      </Grid>
                    </Grid>

                    <Box sx={{ mt: 4, display: "flex", gap: 2 }}>
                      <Button type="submit" variant="contained" color="primary">
                        Register
                      </Button>
                      <Button variant="outlined" color="secondary" component={Link} to="/dashboard">
                        Home
                      </Button>
                    </Box>
                  </form>


                </Box>
              )}

              {registrationType === "bulk" && (
                <Box
                  sx={{
                    mt: 4,
                    px: 4,
                    py: 5,
                    borderRadius: 3,
                    boxShadow: 4,
                    bgcolor: "background.paper",
                    mx: "auto",
                  }}
                >

                  <Button
                    variant="outlined"
                    color="success"
                    onClick={handleDownloadTemplate}
                    sx={{ mb: 2 }}
                  >
                    Download Excel Template
                  </Button>
                  <Typography
                    variant="body2"
                    color="text.secondary"
                    sx={{ mb: 1, fontStyle: "italic" }}
                  >
                    Please don’t change column names in the Excel template.
                  </Typography>
                  <Box
                    sx={{
                      borderBottom: "1px solid",
                      borderColor: "divider",
                      mb: 1,
                    }}
                  />
                  <Typography
                    variant="subtitle1"
                    sx={{ mb: 1, fontWeight: 500 }}
                  >
                    Upload Excel File (.xlsx)
                  </Typography>

                  <Typography
                    variant="body2"
                    color="error"
                    sx={{ mb: 1 }}
                  >
                    * Required fields: <b>student_name, email_id, contact_no</b>
                  </Typography>

                  <Box
                    sx={{
                      display: "flex",
                      alignItems: "center",
                      border: "2px dashed #ccc",
                      borderRadius: 2,
                      padding: 2,
                      bgcolor: "#f9f9f9",
                      flexWrap: "wrap",
                    }}
                  >
                    <input
                      type="file"
                      accept=".xlsx"
                      onChange={handleFileChange}
                      style={{ display: "none" }}
                      id="file-upload"
                    />

                    <label htmlFor="file-upload">
                      <Button
                        variant="contained"
                        component="span"
                        sx={{ mr: 2 }}
                      >
                        Choose File
                      </Button>
                    </label>

                    {file && (
                      <Typography variant="body2" sx={{ mt: { xs: 2, sm: 0 } }}>
                        {file.name}
                      </Typography>
                    )}
                  </Box>

                  <Box sx={{ mt: 2, display: "flex", gap: 2 }}>
                    <Button
                      onClick={handleUpload}
                      variant="contained"
                      color="primary"
                      disabled={uploading || !file}
                      sx={{ fontWeight: 600 }}
                    >
                      {uploading ? (
                        <CircularProgress size={24} color="inherit" />
                      ) : (
                        "Submit File"
                      )}
                    </Button>
                    <Button
                      variant="outlined"
                      color="secondary"
                      component={Link}
                      to="/dashboard"
                    >
                      Home
                    </Button>
                  </Box>
                </Box>
              )}

            </Paper>

          </Box>
        )}
        {activeTab === 1 && (
          <Box sx={{ mt: 1, px: 1 }}>
            <Paper elevation={3} sx={{ p: 2, borderRadius: 3 }}>

              {/* Header */}
              <Typography variant="h6" fontWeight="bold" gutterBottom>
                Move Intern to Batch
              </Typography>
              <Typography variant="subtitle1" color="text.secondary" gutterBottom>
                These students are not assigned to any batch yet.
              </Typography>

              {/* Form Section */}
              <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 2, my: 2 }}>
                <FormControl fullWidth size="small" sx={{ flex: 1, minWidth: 150, size: "small" }}>
                  <InputLabel>Track Name *</InputLabel>
                  <Select
                    value={selectedTrack}
                    label="Track Name *"
                    onChange={handleTrackChange}
                  >
                    <MenuItem value="">Select Track</MenuItem>
                    {tracks.map((track) => (
                      <MenuItem key={track.id} value={track.track_name}>
                        {track.track_name}
                      </MenuItem>
                    ))}
                  </Select>
                </FormControl>

                <FormControl fullWidth size="small" sx={{ flex: 1, minWidth: 150 }}>
                  <InputLabel>Batch Name *</InputLabel>
                  <Select
                    value={selectedBatch}
                    label="Batch Name *"
                    onChange={(e) => setSelectedBatch(e.target.value)}
                    disabled={!batches.length}
                  >
                    <MenuItem value="">Select Batch</MenuItem>
                    {batches.length === 0 ? (
                      <MenuItem disabled>No batches found</MenuItem>
                    ) : (
                      batches.map((batch, index) => (
                        <MenuItem key={index} value={batch.batch_name}>
                          {batch.batch_name}
                        </MenuItem>
                      ))
                    )}
                  </Select>
                </FormControl>

                <TextField
                  label="Reason for Move"
                  value={moveReason}
                  onChange={(e) => setMoveReason(e.target.value)}
                  fullWidth
                  required
                  size="small"
                  sx={{ flex: 1, minWidth: 150 }}
                />
              </Box>

              {/* Table Section */}
              <Box
                sx={{
                  border: '1px solid #e0e0e0',
                  borderRadius: 2,
                  mb: 3,
                  backgroundColor: '#f9f9fc',
                  boxShadow: 2,
                }}
              >
                {/* Fixed Search Field */}
                <Box sx={{ p: 2, borderBottom: '1px solid #ddd', backgroundColor: '#f9f9fc', maxWidth: "50%" }}>
                  <TextField
                    label="Search Intern by Name, Email or Contact"
                    variant="outlined"
                    fullWidth
                    size="small"
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                  />
                </Box>

                {/* Scrollable Table */}
                <Box sx={{ height: 200, overflowY: 'auto', px: 2 }}>
                  <Table stickyHeader size="small">
                    <TableHead>
                      <TableRow sx={{ backgroundColor: '#f5f5f5' }}>
                        <TableCell padding="checkbox" sx={{ border: '1px solid #ccc' }}>
                          <Checkbox
                            checked={
                              selectedStudentIds.length === filteredStudents.length &&
                              filteredStudents.length > 0
                            }
                            onChange={toggleSelectAll}
                          />
                        </TableCell>
                        <TableCell sx={{ border: '1px solid #ccc' }}><strong>Intern ID</strong></TableCell>
                        <TableCell sx={{ border: '1px solid #ccc' }}><strong>Name</strong></TableCell>
                        <TableCell sx={{ border: '1px solid #ccc' }}><strong>Email</strong></TableCell>
                        <TableCell sx={{ border: '1px solid #ccc' }}><strong>Contact</strong></TableCell>
                      </TableRow>
                    </TableHead>
                    <TableBody>
                      {filteredStudents.length > 0 ? (
                        filteredStudents.map((student) => (
                          <TableRow
                            key={student.id}
                            hover
                            sx={{
                              height: 48,
                              '&:nth-of-type(odd)': {
                                backgroundColor: '#ffffff',
                              },
                              '&:hover': {
                                backgroundColor: '#f1f1f1',
                              },
                            }}
                          >
                            <TableCell padding="checkbox" sx={{ border: '1px solid #ccc' }}>
                              <Checkbox
                                checked={selectedStudentIds.includes(student.id)}
                                onChange={() => toggleSelectOne(student.id)}
                              />
                            </TableCell>
                            <TableCell sx={{ border: '1px solid #ccc' }}>{student.id}</TableCell>
                            <TableCell sx={{ border: '1px solid #ccc' }}>{student.student_name}</TableCell>
                            <TableCell sx={{ border: '1px solid #ccc' }}>{student.email_id}</TableCell>
                            <TableCell sx={{ border: '1px solid #ccc' }}>{student.contact_no}</TableCell>
                          </TableRow>
                        ))
                      ) : (
                        <TableRow>
                          <TableCell colSpan={5} align="center" sx={{ border: '1px solid #ccc' }}>
                            No matching students found.
                          </TableCell>
                        </TableRow>
                      )}
                    </TableBody>
                  </Table>

                </Box>
              </Box>



              {/* Submit Button */}
              <Box sx={{ display: 'flex', justifyContent: 'flex-start' }}>
                <Tooltip
                  title={
                    !selectedBatch || !moveReason || selectedStudentIds.length === 0
                      ? 'Please fill all required fields and select at least one student.'
                      : ''
                  }
                  arrow
                  placement="top"
                >
                  <span> {/* Wrapper for Tooltip to work with disabled Button */}
                    <Button
                      variant="contained"
                      color="primary"
                      onClick={handleMoveStudentsInBatch}
                      disabled={!selectedBatch || !moveReason || selectedStudentIds.length === 0}
                      size="large"
                      sx={{ px: 4, py: 1.5, borderRadius: 2, textTransform: 'none' }}
                    >
                      Move Selected Students
                    </Button>
                  </span>
                </Tooltip>
              </Box>
            </Paper>
          </Box>
        )}
      </Container>

      {/* Dialog Component */}
      <Dialog
        open={dialogOpen}
        onClose={handleCloseDialog}
        aria-labelledby="alert-dialog-title"
        aria-describedby="alert-dialog-description"
        PaperProps={{
          style: {
            position: "absolute",
            top: "10%",
            margin: "auto",
            padding: "20px",
            borderRadius: "10px",
            backgroundColor: "#ffffea",
            width: "50%",
          },
        }}
        maxWidth="sm"
        fullWidth
      >
        <DialogTitle
          id="alert-dialog-title"
          sx={{ color: dialogTitle === "Success" ? "green" : "red" }}
        >
          {dialogTitle}
        </DialogTitle>

        <DialogContent dividers>
          <Typography variant="body1" gutterBottom sx={{ color: "#0096FF" }}>
            {dialogMessage}
          </Typography>

          {validationErrors.length > 0 && (
            <>
              <Typography
                variant="subtitle2"
                sx={{ mt: 2, fontWeight: "bold", color: "red" }}
              >
                Validation Errors:
              </Typography>
              <List dense>
                {validationErrors.map((error, idx) => (
                  <ListItem key={`error-${idx}`} disablePadding>
                    <ListItemText primary={`• ${error}`} />
                  </ListItem>
                ))}
              </List>
            </>
          )}

          {ignoredRows.length > 0 && (
            <>
              <Typography
                variant="subtitle2"
                sx={{ mt: 2, fontWeight: "bold", color: "orange" }}
              >
                Ignored Records:
              </Typography>
              <List dense>
                {ignoredRows.map((msg, idx) => (
                  <ListItem key={`ignored-${idx}`} disablePadding>
                    <ListItemText primary={`• ${msg}`} />
                  </ListItem>
                ))}
              </List>
            </>
          )}
        </DialogContent>

        <DialogActions>
          <Button onClick={handleCloseDialog} color="secondary">
            Cancel
          </Button>
          <Button onClick={handleCloseDialog} variant="contained" color="primary">
            OK
          </Button>
        </DialogActions>
      </Dialog>

      <Snackbar
        open={snackbarOpen}
        autoHideDuration={4000}
        onClose={() => setSnackbarOpen(false)}
        anchorOrigin={{ vertical: 'top', horizontal: 'center' }}
      >
        <Alert onClose={() => setSnackbarOpen(false)} severity={snackbarSeverity} sx={{ width: '100%' }}>
          {snackbarMessage}
        </Alert>
      </Snackbar>


    </>
  );
};

export default StudentRegistration;