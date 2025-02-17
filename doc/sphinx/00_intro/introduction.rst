************
Introduction
************

This is the documentation for the **ATS-5 Benchmarks**. 

Assuring that real applications perform efficiently on ATS-5 is key to their success. 
A suite of benchmarks  have been developed for Request For Proposal (RFP) response evaluation and system acceptance. 
These codes are representative of the workloads of the NNSA laboratories. 

The benchmarks contained within this site represent a pre-RFP draft state. Over the next few months the 
benchmarks will change somewhat. While we expect most of the changes will be additions and modifications it is possible that we will remove 
benchmarks prior to RFP. 

To use these benchmarks please refer to the ATS-5 benchmarks repository `ATS-5 repo <https://github.com/lanl/benchmarks>`_

The benchmarks will, eventually, be generated atop Crossroads as the reference
system (see :ref:`ReferenceCrossroads` for more information).

Benchmark Changes from Crossroads
=================================

The key differences from Crossroads benchmarks and ATS-5 benchmarks are as summarized below: 

.. list-table::

 * - **Crossroads**
   - **ATS-5**
   - **Notes**
 * - Few GPU-ready benchmarks
   - | All proxy benchmarks have 
     | GPU implementations. 
   - 
 * - | System level performance metric: 
     | Scalable System Improvement 
     | geometric mean of app FOMs.
     | Use of single node benchmarks 
     | for RFP.
   - | Multi-node benchmarking for 
     | system acceptance based on 
     | RFP benchmarks, negotiated 
     | with vendor as part of SOW. 
   - | Attempting to limit multi-node 
     | benchmarking for RFP
     | to communication (MPI), and 
     | IO (IOR). Expect responses to 
     | include multiple node 
     | configurations and ability to 
     | compose them to meet our needs 
     | in a codesign partnership.  
     | Will use scaled single node 
     | improvement to assess proposals 
     | (along with other factors) and 
     | SSI for acceptance. 
 * - | Mini-Apps + full scale apps 
     | some of which were export 
     | controlled.
   - | Mini-apps only - all open 
     | source. 
   - 
 * - No Machine Learning. 
   - | ML training and inference 
     | included. 
   - | Focuses on material science
     | workloads of relevance. 



Benchmark Overview 
==================

.. list-table::

 * - **Benchmark**
   - **Description**
   - **Language**
   - **Parallelism** 
 * - Branson
   - Implicit Monte Carlo transport
   - C++
   - MPI + Cuda/HIP
 * - AMG2023
   - | AMG solver of sparse matrices 
     | using Hypre 
   - C 
   - | MPI+CUDA/HIP/SYCL
     | OpenMP on CPU
 * - MiniEM
   - Electro-Magnetics solver
   - C++
   - MPI+Kokkos
 * - MLMD
   - | ML Training of interatomic 
     | potential model using HIPYNN 
     | on VASP Simulation data. 
     | ML inference using LAMMPS, 
     | Kokkos, and HIPYNN trained 
     | interatomic potential model.
   - Python, C++, C
   - MPI+Cuda/HIP
 * - Parthenon-VIBE
   - | Block structured AMR proxy using 
     | the Parthenon framework.
   - C++
   - MPI+Kokkos
 * - Sparta
   - Direct Simulation Monte Carlo
   - C++
   - MPI+Kokkos
 * - UMT
   - Deterministic (Sn) transport
   - Fortran
   - | MPI+OpenMP and 
     | OpenMP Offload



Microbenchmark Overview
=======================

.. list-table::

 * - **Benchmark**
   - **Description**
   - **Language**
   - **Parallelism** 
   - **Multi-node**
 * - Stream
   - Streaming memory bandwidth test
   - C/Fortran
   - OpenMP 
   - No
 * - Spatter
   - | Sparse memory bandwidth test
     | driven by application memory 
     | access patterns. 
   - C++
   - | MPI+OpenMP/
     | CUDA/OpenCL 
   - No
 * - | OSU MPI + 
     | Sandia SMB 
     | message rate
   - MPI Performance Benchmarks
   - C++
   - MPI
   - Yes 
 * - DGEMM
   - | Single node floating-point 
     | performance on matrix multiply. 
   - C/Fortran
   - Various
   - No
 * - DAXPY
   - | Single node floating-point 
     | performance of a scaled vector
     | plus a vector. 
   - C/Fortran
   - Various
   - No
 * - IOR
   - | Performance testing of parallel 
     | file system using various
     | interfaces and access patterns. 
   - C
   - MPI
   - No
 * - mdtest
   - | Metadata benchmark that performs 
     | open/stat/close operations on 
     | files and directories. 
   - C
   - MPI
   - Yes


Run Rules Synopsis
==================

Single node benchmarks will require respondent to provide estimates on

* strong scaling for CPU architectures. 

* throughput curves for GPU architectures. 

* estimates must be provided for each compute node type (including options).

* Problem size must be changed to meet % of memory requirements. 

Source code modification categories: 

* Baseline: “out-of-the-box” performance

  * Code modifications not permitted 

  * Compiler options can be modified, library substitutions permitted, problem decomposition may be changed 

* Ported: “alternative baseline for new architectures” 
  
  * Limited source-code modifications are permitted to port and tune for the target architecture using directives or commonly used interfaces. 

* Optimized: "speed of light"
  
  * Aggressive code changes that enhance performance are permitted.

  * Algorithms fundamental to the program may not be replaced. 

  * The modified code must still pass validation tests. 

Required results: 

 * A **baseline** or **ported** result is required for each benchmark. If baseline cannot be obtained, ported results may be provided. 

Optional results: 

 * **Ported** results may be provided in addition to the baseline if minor code changes enable substantial performance gain. 

 * **Optimized** results to showcase system capabilities. 

Scaled Single Node Improvement
==============================
One element of evaluation will focus on scaled single node improvement (SSNI). SSNI is defined as follows: 

Given two platforms using one as a reference, SSNI is defined as a weighted geometric mean using the following equation. 

.. math::

   SSNI = N(\prod_{i=1}^{M}(S_i)^{w_i})^\frac{1}{\sum_{i=1}^{M}{W_i}}


Where: 

*	N = Number of nodes on ATS-5 system / Number of nodes on reference system,

*	M = total number of Benchmarks,

*	S = application speedup; Figure of Merit on ATS-5 system / Figure of Merit on reference system (Crossroads); S must be greater than 1, 

*	w = weighting factor. 



Approvals
=========

- LA-UR-23-22084 Approved for public release; distribution is unlimited.
- Content from Sandia National Laboratories considered unclassified with
  unlimited distribution under SAND2023-12176O, SAND2023-01069O, and
  SAND2023-01070O.


