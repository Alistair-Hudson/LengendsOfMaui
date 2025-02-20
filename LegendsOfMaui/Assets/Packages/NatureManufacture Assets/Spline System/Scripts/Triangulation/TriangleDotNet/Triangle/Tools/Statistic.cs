﻿// -----------------------------------------------------------------------
// <copyright file="Statistic.cs">
// Original Triangle code by Jonathan Richard Shewchuk, http://www.cs.cmu.edu/~quake/triangle.html
// Triangle.NET code by Christian Woltering, http://triangle.codeplex.com/
// </copyright>
// -----------------------------------------------------------------------

using System;
using TriangleNet.Geometry;
using TriangleNet.Topology;

namespace TriangleNet.Tools
{
    /// <summary>
    ///     Gather mesh statistics.
    /// </summary>
    public class Statistic
    {
        private static readonly int[] plus1Mod3 = { 1, 2, 0 };
        private static readonly int[] minus1Mod3 = { 2, 0, 1 };

        #region Private methods

        private void GetAspectHistogram(Mesh mesh)
        {
            int[] aspecttable;
            double[] ratiotable;

            aspecttable = new int[16];
            ratiotable = new[]
            {
                1.5, 2.0, 2.5, 3.0, 4.0, 6.0, 10.0, 15.0, 25.0, 50.0,
                100.0, 300.0, 1000.0, 10000.0, 100000.0, 0.0
            };


            var tri = default(Otri);
            Vertex[] p = new Vertex[3];
            double[] dx = new double[3], dy = new double[3];
            double[] edgelength = new double[3];
            double triarea;
            double trilongest2;
            double triminaltitude2;
            double triaspect2;

            int aspectindex;
            int i, j, k;

            tri.orient = 0;
            foreach (Triangle t in mesh.triangles)
            {
                tri.tri = t;
                p[0] = tri.Org();
                p[1] = tri.Dest();
                p[2] = tri.Apex();
                trilongest2 = 0.0;

                for (i = 0; i < 3; i++)
                {
                    j = plus1Mod3[i];
                    k = minus1Mod3[i];
                    dx[i] = p[j].x - p[k].x;
                    dy[i] = p[j].y - p[k].y;
                    edgelength[i] = dx[i] * dx[i] + dy[i] * dy[i];
                    if (edgelength[i] > trilongest2) trilongest2 = edgelength[i];
                }

                //triarea = Primitives.CounterClockwise(p[0], p[1], p[2]);
                triarea = Math.Abs((p[2].x - p[0].x) * (p[1].y - p[0].y) -
                                   (p[1].x - p[0].x) * (p[2].y - p[0].y)) / 2.0;

                triminaltitude2 = triarea * triarea / trilongest2;

                triaspect2 = trilongest2 / triminaltitude2;

                aspectindex = 0;
                while (triaspect2 > ratiotable[aspectindex] * ratiotable[aspectindex] && aspectindex < 15) aspectindex++;
                aspecttable[aspectindex]++;
            }
        }

        #endregion

        /// <summary>
        ///     Update statistics about the quality of the mesh.
        /// </summary>
        /// <param name="mesh"></param>
        public void Update(Mesh mesh, int sampleDegrees)
        {
            Point[] p = new Point[3];

            int k1, k2;
            int degreeStep;

            //sampleDegrees = 36; // sample every 5 degrees
            //sampleDegrees = 45; // sample every 4 degrees
            sampleDegrees = 60; // sample every 3 degrees

            double[] cosSquareTable = new double[sampleDegrees / 2 - 1];
            double[] dx = new double[3];
            double[] dy = new double[3];
            double[] edgeLength = new double[3];
            double dotProduct;
            double cosSquare;
            double triArea;
            double triLongest2;
            double triMinAltitude2;
            double triAspect2;

            double radconst = Math.PI / sampleDegrees;
            double degconst = 180.0 / Math.PI;

            // New angle table
            AngleHistogram = new int[sampleDegrees];
            MinAngleHistogram = new int[sampleDegrees];
            MaxAngleHistogram = new int[sampleDegrees];

            for (int i = 0; i < sampleDegrees / 2 - 1; i++)
            {
                cosSquareTable[i] = Math.Cos(radconst * (i + 1));
                cosSquareTable[i] = cosSquareTable[i] * cosSquareTable[i];
            }

            for (int i = 0; i < sampleDegrees; i++) AngleHistogram[i] = 0;

            ShortestAltitude = mesh.bounds.Width + mesh.bounds.Height;
            ShortestAltitude = ShortestAltitude * ShortestAltitude;
            LargestAspectRatio = 0.0;
            ShortestEdge = ShortestAltitude;
            LongestEdge = 0.0;
            SmallestArea = ShortestAltitude;
            LargestArea = 0.0;
            SmallestAngle = 0.0;
            LargestAngle = 2.0;

            bool acuteBiggest = true;
            bool acuteBiggestTri = true;

            double triMinAngle, triMaxAngle = 1;

            foreach (Triangle tri in mesh.triangles)
            {
                triMinAngle = 0; // Min angle:  0 < a <  60 degress
                triMaxAngle = 1; // Max angle: 60 < a < 180 degress

                p[0] = tri.vertices[0];
                p[1] = tri.vertices[1];
                p[2] = tri.vertices[2];

                triLongest2 = 0.0;

                for (int i = 0; i < 3; i++)
                {
                    k1 = plus1Mod3[i];
                    k2 = minus1Mod3[i];

                    dx[i] = p[k1].x - p[k2].x;
                    dy[i] = p[k1].y - p[k2].y;

                    edgeLength[i] = dx[i] * dx[i] + dy[i] * dy[i];

                    if (edgeLength[i] > triLongest2) triLongest2 = edgeLength[i];

                    if (edgeLength[i] > LongestEdge) LongestEdge = edgeLength[i];

                    if (edgeLength[i] < ShortestEdge) ShortestEdge = edgeLength[i];
                }

                //triarea = Primitives.CounterClockwise(p[0], p[1], p[2]);
                triArea = Math.Abs((p[2].x - p[0].x) * (p[1].y - p[0].y) -
                                   (p[1].x - p[0].x) * (p[2].y - p[0].y));

                if (triArea < SmallestArea) SmallestArea = triArea;

                if (triArea > LargestArea) LargestArea = triArea;

                triMinAltitude2 = triArea * triArea / triLongest2;
                if (triMinAltitude2 < ShortestAltitude) ShortestAltitude = triMinAltitude2;

                triAspect2 = triLongest2 / triMinAltitude2;
                if (triAspect2 > LargestAspectRatio) LargestAspectRatio = triAspect2;

                for (int i = 0; i < 3; i++)
                {
                    k1 = plus1Mod3[i];
                    k2 = minus1Mod3[i];

                    dotProduct = dx[k1] * dx[k2] + dy[k1] * dy[k2];
                    cosSquare = dotProduct * dotProduct / (edgeLength[k1] * edgeLength[k2]);
                    degreeStep = sampleDegrees / 2 - 1;

                    for (int j = degreeStep - 1; j >= 0; j--)
                        if (cosSquare > cosSquareTable[j])
                            degreeStep = j;

                    if (dotProduct <= 0.0)
                    {
                        AngleHistogram[degreeStep]++;
                        if (cosSquare > SmallestAngle) SmallestAngle = cosSquare;
                        if (acuteBiggest && cosSquare < LargestAngle) LargestAngle = cosSquare;

                        // Update min/max angle per triangle
                        if (cosSquare > triMinAngle) triMinAngle = cosSquare;
                        if (acuteBiggestTri && cosSquare < triMaxAngle) triMaxAngle = cosSquare;
                    }
                    else
                    {
                        AngleHistogram[sampleDegrees - degreeStep - 1]++;
                        if (acuteBiggest || cosSquare > LargestAngle)
                        {
                            LargestAngle = cosSquare;
                            acuteBiggest = false;
                        }

                        // Update max angle for (possibly non-acute) triangle
                        if (acuteBiggestTri || cosSquare > triMaxAngle)
                        {
                            triMaxAngle = cosSquare;
                            acuteBiggestTri = false;
                        }
                    }
                }

                // Update min angle histogram
                degreeStep = sampleDegrees / 2 - 1;

                for (int j = degreeStep - 1; j >= 0; j--)
                    if (triMinAngle > cosSquareTable[j])
                        degreeStep = j;
                MinAngleHistogram[degreeStep]++;

                // Update max angle histogram
                degreeStep = sampleDegrees / 2 - 1;

                for (int j = degreeStep - 1; j >= 0; j--)
                    if (triMaxAngle > cosSquareTable[j])
                        degreeStep = j;

                if (acuteBiggestTri)
                    MaxAngleHistogram[degreeStep]++;
                else
                    MaxAngleHistogram[sampleDegrees - degreeStep - 1]++;

                acuteBiggestTri = true;
            }

            ShortestEdge = Math.Sqrt(ShortestEdge);
            LongestEdge = Math.Sqrt(LongestEdge);
            ShortestAltitude = Math.Sqrt(ShortestAltitude);
            LargestAspectRatio = Math.Sqrt(LargestAspectRatio);
            SmallestArea *= 0.5;
            LargestArea *= 0.5;
            if (SmallestAngle >= 1.0)
                SmallestAngle = 0.0;
            else
                SmallestAngle = degconst * Math.Acos(Math.Sqrt(SmallestAngle));

            if (LargestAngle >= 1.0)
            {
                LargestAngle = 180.0;
            }
            else
            {
                if (acuteBiggest)
                    LargestAngle = degconst * Math.Acos(Math.Sqrt(LargestAngle));
                else
                    LargestAngle = 180.0 - degconst * Math.Acos(Math.Sqrt(LargestAngle));
            }
        }

        #region Static members

        /// <summary>
        ///     Number of incircle tests performed.
        /// </summary>
        public static long InCircleCount = 0;

        public static long InCircleAdaptCount = 0;

        /// <summary>
        ///     Number of counterclockwise tests performed.
        /// </summary>
        public static long CounterClockwiseCount = 0;

        public static long CounterClockwiseAdaptCount = 0;

        /// <summary>
        ///     Number of 3D orientation tests performed.
        /// </summary>
        public static long Orient3dCount = 0;

        /// <summary>
        ///     Number of right-of-hyperbola tests performed.
        /// </summary>
        public static long HyperbolaCount = 0;

        /// <summary>
        ///     // Number of circumcenter calculations performed.
        /// </summary>
        public static long CircumcenterCount = 0;

        /// <summary>
        ///     Number of circle top calculations performed.
        /// </summary>
        public static long CircleTopCount = 0;

        /// <summary>
        ///     Number of vertex relocations.
        /// </summary>
        public static long RelocationCount = 0;

        #endregion

        #region Properties

        /// <summary>
        ///     Gets the shortest edge.
        /// </summary>
        public double ShortestEdge { get; private set; }

        /// <summary>
        ///     Gets the longest edge.
        /// </summary>
        public double LongestEdge { get; private set; }

        //

        /// <summary>
        ///     Gets the shortest altitude.
        /// </summary>
        public double ShortestAltitude { get; private set; }

        /// <summary>
        ///     Gets the largest aspect ratio.
        /// </summary>
        public double LargestAspectRatio { get; private set; }

        /// <summary>
        ///     Gets the smallest area.
        /// </summary>
        public double SmallestArea { get; private set; }

        /// <summary>
        ///     Gets the largest area.
        /// </summary>
        public double LargestArea { get; private set; }

        /// <summary>
        ///     Gets the smallest angle.
        /// </summary>
        public double SmallestAngle { get; private set; }

        /// <summary>
        ///     Gets the largest angle.
        /// </summary>
        public double LargestAngle { get; private set; }

        /// <summary>
        ///     Gets the angle histogram.
        /// </summary>
        public int[] AngleHistogram { get; private set; }

        /// <summary>
        ///     Gets the min angles histogram.
        /// </summary>
        public int[] MinAngleHistogram { get; private set; }

        /// <summary>
        ///     Gets the max angles histogram.
        /// </summary>
        public int[] MaxAngleHistogram { get; private set; }

        #endregion
    }
}