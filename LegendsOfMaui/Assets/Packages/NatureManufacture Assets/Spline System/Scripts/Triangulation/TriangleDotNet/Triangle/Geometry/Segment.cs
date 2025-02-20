﻿// -----------------------------------------------------------------------
// <copyright file="Segment.cs" company="">
// Triangle.NET code by Christian Woltering, http://triangle.codeplex.com/
// </copyright>
// -----------------------------------------------------------------------

using System;
using TriangleNet.Topology;

namespace TriangleNet.Geometry
{
    /// <summary>
    ///     Represents a straight line segment in 2D space.
    /// </summary>
    public class Segment : ISegment
    {
        private readonly Vertex v0;
        private readonly Vertex v1;

        /// <summary>
        ///     Initializes a new instance of the <see cref="Segment" /> class.
        /// </summary>
        public Segment(Vertex v0, Vertex v1)
            : this(v0, v1, 0)
        {
        }

        /// <summary>
        ///     Initializes a new instance of the <see cref="Segment" /> class.
        /// </summary>
        public Segment(Vertex v0, Vertex v1, int label)
        {
            this.v0 = v0;
            this.v1 = v1;

            this.Label = label;
        }

        /// <summary>
        ///     Gets or sets the segments boundary mark.
        /// </summary>
        public int Label { get; set; }

        /// <summary>
        ///     Gets the first endpoints index.
        /// </summary>
        public int P0 => v0.id;

        /// <summary>
        ///     Gets the second endpoints index.
        /// </summary>
        public int P1 => v1.id;

        /// <summary>
        ///     Gets the specified segment endpoint.
        /// </summary>
        /// <param name="index">The endpoint index (0 or 1).</param>
        /// <returns></returns>
        public Vertex GetVertex(int index)
        {
            if (index == 0) return v0;

            if (index == 1) return v1;

            throw new IndexOutOfRangeException();
        }

        /// <summary>
        ///     WARNING: not implemented.
        /// </summary>
        public ITriangle GetTriangle(int index)
        {
            //throw new NoImplementedException();
            return new Triangle();
        }
    }
}